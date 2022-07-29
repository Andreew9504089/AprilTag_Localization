#include <set>
#include <string>
#include <cmath>
#include <vector>
#include <stdio.h>
#include <cstdlib>
#include <fstream>
#include <unistd.h>
#include <iostream>
#include <Eigen/LU>
#include <Eigen/SVD>
#include <ros/ros.h>
#include <Eigen/Core>
#include <Eigen/Dense>
#include <type_traits>
#include <Eigen/Geometry>
#include <boost/array.hpp>
#include <nav_msgs/Path.h>
#include <std_msgs/Int64.h>
#include <std_msgs/Header.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Pose.h>
#include <mav_msgs/Actuators.h>
#include <mav_msgs/conversions.h>
#include <mav_msgs/default_topics.h>
#include <apriltag_ros/AprilTagDetection.h>
#include <apriltag_ros/AprilTagDetectionArray.h>
#include <trajectory_msgs/MultiDOFJointTrajectory.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <yaml_service/readTagPos.h>

using namespace std;
using namespace Eigen;
const float DEG_2_RAD = M_PI / 180.0;

class CameraCalibration
{
	public:

		CameraCalibration();
		CameraCalibration(string Type, string pubTopic, string subTopic);

		void Print_error(float x, float y, float z);
		void OdeCallback(const geometry_msgs::Pose::ConstPtr &msg);
		void cameraCallback(const apriltag_ros::AprilTagDetectionArray::ConstPtr &msg);
		Eigen::Quaterniond Quaterion_calcutaion(float i, float j, float k, float w, float x, float y, float z);

		void publish();
		void setTagPos(vector<int> id);

	private:

		string type;
		string Check;
		string A;

		///////////////publisher subscriber/////////////
		ros::NodeHandle nh;
		ros::Publisher Pose_detect;
		ros::Subscriber ode_sub;
		ros::Subscriber tag_sub;

		///////////////Tag position/////////////
		float tag_x;
		float tag_y;
		float tag_z;

		///////////////odometry/////////////
		float ode_x;
		float ode_y;
		float ode_z;

		///////////////camera/////////////
		float x_err;
		float y_err;
		float z_err;

		float cal_x;
		float cal_y;
		float cal_z;

		Eigen::Quaterniond q;
		std_msgs::Header header;
		apriltag_ros::AprilTagDetectionArray tag;

		float x;
		float y;
		float z;
		float i;
		float j;
		float k;
		float w;

		boost::array<float, 36> cov;
		vector<int> id;
		geometry_msgs::PoseWithCovarianceStamped Calibration;

		float index;
};

CameraCalibration::CameraCalibration(string Type, string pubTopic, string subTopic)
{
	type = Type;

	Pose_detect = nh.advertise<geometry_msgs::PoseWithCovarianceStamped>(pubTopic, 1000);
	tag_sub = nh.subscribe(subTopic, 1000, &CameraCalibration::cameraCallback, this);
	ode_sub = nh.subscribe("/iris1/odometry_sensor1/pose", 1000, &CameraCalibration::OdeCallback, this);

	if(type == "downward")
	{
		tag_x = tag_y = tag_z = 0.05;
	}
	else if(type == "forward")
	{
		tag_x = tag_y = tag_z = 0;
	}
}

Eigen::Quaterniond CameraCalibration::Quaterion_calcutaion(float i, float j, float k, float w, float x, float y, float z)
{
	Eigen::Quaterniond q1;
	Eigen::Quaterniond q2;
	Eigen::Quaterniond q3;

	q1.x() = i; q1.y() = j; q1.z() = k; q1.w() = w;
	q2.x() = x; q2.y() = y; q2.z() = z; q2.w() = 0;

	q3 = q1.inverse() * q2 * q1;

	return q3;
}

void CameraCalibration::OdeCallback(const geometry_msgs::Pose::ConstPtr &msg)
{
	ode_x = (*msg).position.x;
	ode_y = (*msg).position.y;
    ode_z = (*msg).position.z;
}

void CameraCalibration::cameraCallback(const apriltag_ros::AprilTagDetectionArray::ConstPtr &msg)
{
	if (msg->detections.size() > 0)
	{
		Check = "Yes";

		tag = *msg;

		// id = tag.detections[0].id;
		// header = tag.detections[0].pose.header;
		// cov = tag.detections[0].pose.pose.covariance;
		// x = tag.detections[0].pose.pose.pose.position.x;
		// y = tag.detections[0].pose.pose.pose.position.y;
	 //    z = tag.detections[0].pose.pose.pose.position.z;
	 //    i = tag.detections[0].pose.pose.pose.orientation.x;
	 //    j = tag.detections[0].pose.pose.pose.orientation.y;
	 //    k = tag.detections[0].pose.pose.pose.orientation.z;
	 //    w = tag.detections[0].pose.pose.pose.orientation.w;

	    // q = Quaterion_calcutaion(i, j, k, w, x, y, z);

	    if(type == "downward")
	    {
	    	id = tag.detections[0].id;
			header = tag.detections[0].pose.header;
			cov = tag.detections[0].pose.pose.covariance;
			x = tag.detections[0].pose.pose.pose.position.x;
			y = tag.detections[0].pose.pose.pose.position.y;
		    z = tag.detections[0].pose.pose.pose.position.z;
		    i = tag.detections[0].pose.pose.pose.orientation.x;
		    j = tag.detections[0].pose.pose.pose.orientation.y;
		    k = tag.detections[0].pose.pose.pose.orientation.z;
		    w = tag.detections[0].pose.pose.pose.orientation.w;

	    	Print_error(y, x, z);
	    }
		else if(type == "forward")
		{
			index = tag.detections.size();

			// id = tag.detections[index - 1].id;
			// header = tag.detections[index - 1].pose.header;
			// cov = tag.detections[index - 1].pose.pose.covariance;
			// x = tag.detections[index - 1].pose.pose.pose.position.x;
			// y = tag.detections[index - 1].pose.pose.pose.position.y;
		 //    z = tag.detections[index - 1].pose.pose.pose.position.z;
		 //    i = tag.detections[index - 1].pose.pose.pose.orientation.x;
		 //    j = tag.detections[index - 1].pose.pose.pose.orientation.y;
		 //    k = tag.detections[index - 1].pose.pose.pose.orientation.z;
		 //    w = tag.detections[index - 1].pose.pose.pose.orientation.w;

		    id = tag.detections[0].id;
			header = tag.detections[0].pose.header;
			cov = tag.detections[0].pose.pose.covariance;
			x = tag.detections[0].pose.pose.pose.position.x;
			y = tag.detections[0].pose.pose.pose.position.y;
		    z = tag.detections[0].pose.pose.pose.position.z;
		    i = tag.detections[0].pose.pose.pose.orientation.x;
		    j = tag.detections[0].pose.pose.pose.orientation.y;
		    k = tag.detections[0].pose.pose.pose.orientation.z;
		    w = tag.detections[0].pose.pose.pose.orientation.w;

			Print_error(y, x, z);
		}

		Calibration.header = header;
		Calibration.pose.covariance = cov;
		Calibration.header.frame_id = "iris1/odometry_sensor1";
		Calibration.pose.pose.position.x = cal_x;
		Calibration.pose.pose.position.y = cal_y;
		Calibration.pose.pose.position.z = cal_z;
	}
	else
	{
		Check = "No";
	}
}

void CameraCalibration::Print_error(float x, float y, float z)
{

	setTagPos(id);

	if(type == "downward")
	{

		cal_x = x + tag_x;
		cal_y = y + tag_y;
		cal_z = z + 0.01 + tag_z;
	}
	else if(type == "forward")
	{

		cal_x = tag_x - (z + 0.05) - 0.1;
		cal_y = tag_y + y;
		cal_z = tag_z + x;
	}

	// cout << "calbration_" << type << "_x: "<< cal_x 
	// 	<< ", calbration_" << type << "_y: " << cal_y 
	// 	<< ", calbration_" << type << "_z: " << cal_z << endl;

	// x_err = abs(ode_x - cal_x);
	// y_err = abs(ode_y - cal_y);
	// z_err = abs(ode_z - cal_z);

	// cout << type << "_error_x: " << x_err << ", " << type << "_error_y: " << y_err 
	// 	<< ", " << type << "_error_z: " << z_err << endl << endl;
}

void CameraCalibration::setTagPos(vector<int> id)
{
	ros::ServiceClient client = nh.serviceClient<yaml_service::readTagPos>("read_tag_pos");
	yaml_service::readTagPos srv;

	if(id.size() != 0){
		srv.request.id = id[0];
		if(client.call(srv)){
			//ROS_INFO("===Tag Detected===");
			if(type == "downward"){
				tag_x = srv.response.x;
				tag_y = srv.response.y;
				//std::cout << id[0] << std::endl << "x: " << tag_x << std::endl << "y: " << tag_y << std::endl;

			}	
			if(type == "forward"){
				tag_x = srv.response.x;
				tag_y = srv.response.y;
				tag_z = srv.response.z;
			}
		}
		else{
			ROS_ERROR("===Yaml Service Failed===");
		}
	
	}
}

void CameraCalibration::publish()
{
	if (Check == "Yes")
	{
		Pose_detect.publish(Calibration);
	}
	else if (Check == "No")
	{
		A = "No tag detected";
	}
}

int main(int argc, char** argv)
{
	ROS_INFO("Calibration and Calculating Error");
	ros::init(argc, argv, "Error_calculator");

	CameraCalibration c_downward("downward", "/iris1/pose_d", "/downward/tag_detections");
	CameraCalibration c_forward("forward", "/iris1/pose_f", "/forward/tag_detections");

	while(ros::ok())
	{
		ros::spinOnce();

		c_downward.publish();
		c_forward.publish();
	}
}
