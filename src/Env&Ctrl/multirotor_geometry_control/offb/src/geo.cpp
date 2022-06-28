#
#include <ros/ros.h>
#include <geometric_controller.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/PointStamped.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/TwistStamped.h>
#include <gazebo_msgs/ModelStates.h>
#include <gazebo_msgs/LinkStates.h>
#include <tf/transform_datatypes.h>
#include <qptrajectory.h>
#include <cstdio>
#include <unistd.h>
#include <termios.h>
#include <fcntl.h>
#include <eigen3/Eigen/Dense>
#include <eigen3/Eigen/Core>
#include <geometry_msgs/Wrench.h>
#include <geometry_msgs/WrenchStamped.h>
#include <tf2/transform_datatypes.h>
#include <tf/transform_datatypes.h>
#include <trajectory_msgs/MultiDOFJointTrajectoryPoint.h>
#include <sensor_msgs/Imu.h>
#include <nav_msgs/Odometry.h>
#include <nav_msgs/Path.h>
#include <mav_msgs/conversions.h>
#include <mav_msgs/default_topics.h>
#include <ros/callback_queue.h>
#include <std_msgs/Int8.h>
#include "apriltag_ros/AprilTagDetectionArray.h"

#define normal
#define PI 3.14159


gazebo_msgs::ModelStates model_states;
float vir_x, vir_y,vir_z,vx,vy,vz,ax,ay,az;
unsigned int tick=0;
unsigned int counter = 0;
bool flag = false;
mavros_msgs::State current_state;
gazebo_msgs::LinkStates link_states;
geometry_msgs::PoseStamped desired_pose;
nav_msgs::Path UAV_path;
geometry_msgs::PointStamped ugv_pos;
geometry_msgs::PointStamped uav_pos;
geometry_msgs::PoseWithCovariance apriltag_pose;
geometry_msgs::Point target_pos;
geometry_msgs::Point track_pos;
std::vector<float> path_points_x{0.0};
std::vector<float> path_points_y{0.0};
std::vector<float> path_points_z{0.0};
std::vector<float> path_points_yaw{0.0};

int path_length{0};
double tt;
double r = 2;
double T = 280*M_PI;
int mode = 0;
int clk = 0;
int path_valid = 0;
double error = 0.0;
trajectory_profile start, goal;


ros::Publisher start_pose_pub, traj_pub, goal_pub, mode_pub;
ros::Subscriber wpSub, UAV_pos_sub, mode_sub, target_sub, ugv_sub, track_sub;


void setStart(){

	geometry_msgs::PoseWithCovarianceStamped posec;

	posec.pose.pose.position.x = uav_pos.point.x;
	posec.pose.pose.position.y = uav_pos.point.y;
	posec.pose.pose.orientation.z =0.671442089592;
	posec.pose.pose.orientation.w =0.741057029064;
	posec.header.frame_id = "map";
	posec.header.stamp = ros::Time::now();
	start_pose_pub.publish(posec);

}

void setGoal(geometry_msgs::PointStamped init_pos){
	geometry_msgs::PoseWithCovarianceStamped posec;

	posec.pose.pose.position.x = init_pos.point.x;
	posec.pose.pose.position.y = init_pos.point.y;
	posec.pose.pose.orientation.z =0.671442089592;
	posec.pose.pose.orientation.w =0.741057029064;
	posec.header.frame_id = "map";
	posec.header.stamp = ros::Time::now();
	goal_pub.publish(posec);

}

void pathCallback(const nav_msgs::Path::ConstPtr& msg){
	nav_msgs::Path tmp = *msg;
	trajectory_profile next_goal;
	if(tmp.poses.size() > 0){
		//std::cout << tmp << std::endl;
		next_goal.pos << tmp.poses[0].pose.position.x, tmp.poses[0].pose.position.y, 5;
		if((goal.pos - next_goal.pos).norm() > 1){
			ROS_WARN("====Set Start/Goal====");
			ROS_WARN("New Path Received...");
			tick = 0;
			path_valid = 1;

			UAV_path = *msg;
			path_points_x.clear();
			path_points_y.clear();
			path_points_z.clear();
			path_points_yaw.clear();

			path_length = UAV_path.poses.size();
			// std::cout << "Path Length: " << path_length << std::endl;

			for(int i=0; i < path_length; i++){
				path_points_x.push_back(UAV_path.poses[path_length-i-1].pose.position.x);
				path_points_y.push_back(UAV_path.poses[path_length-i-1].pose.position.y);
				path_points_z.push_back(UAV_path.poses[path_length-i-1].pose.position.z);
				path_points_yaw.push_back(tf::getYaw(UAV_path.poses[path_length-i-1].pose.orientation));
			}

			return;
		}else return;
	}else return;

}

void uavPosCallback(const geometry_msgs::PointStamped::ConstPtr& pos){
	uav_pos = *pos;
}

void apriltagCallback(const apriltag_ros::AprilTagDetectionArray::ConstPtr& msg){
	try{
		apriltag_pose=msg->detections.at(0).pose.pose;
	} catch(const std::out_of_range& e){
		std::cout<<"not detect"<<std::endl;
		apriltag_pose.pose.position.x=0;
		apriltag_pose.pose.position.y=0;
	}
}

void ugvPosCallback(const nav_msgs::Odometry::ConstPtr& pos){
	nav_msgs::Odometry tmp;
	tmp = *pos;
	ugv_pos.point.x = tmp.pose.pose.position.x;
	ugv_pos.point.y = tmp.pose.pose.position.y;
	ugv_pos.point.z = tmp.pose.pose.position.z;
	ugv_pos.header.frame_id = "map";
	ugv_pos.header.stamp = ros::Time::now();
}

void modeCallback(const std_msgs::Int8::ConstPtr& msg){
	std_msgs::Int8 tmp;
	tmp = *msg;
	mode = tmp.data;
}

void targetCallback(const geometry_msgs::Point::ConstPtr& msg){
	target_pos = *msg;
}

void trackCallback(const geometry_msgs::Point::ConstPtr& msg){
	track_pos = *msg;
}

void manualGoalMode(){
	std::string ns;
	ns = ros::this_node::getNamespace();
	std::cout << ns << std::endl;
	ROS_WARN("====Entering Setting Manual Goal====");
	double dt = 10.0;
	ros::Rate loop_rate(dt);

	qptrajectory plan;
	path_def path;
	std::vector<trajectory_profile> data;
	trajectory_msgs::MultiDOFJointTrajectoryPoint traj;
	double sample = 0.05;

	geometry_msgs::Transform transform;
	geometry_msgs::Twist twist;

	goal.pos << 0, 0, 5;

	transform.translation.x = 0;
	transform.translation.y = 0;
	transform.translation.z = 0;
	transform.rotation.x = 0;
	transform.rotation.y = 0;
	transform.rotation.z = 0;
	transform.rotation.w = 0;
	twist.linear.x = 0;
	twist.linear.y = 0;
	twist.linear.z = 0;
	twist.angular.x = 0;
	twist.angular.y = 0;
	twist.angular.z = 0;

	traj.transforms.push_back(transform);
	traj.velocities.push_back(twist);
	traj.accelerations.push_back(twist);

	while(ros::ok() && mode == 2){ 
		if(path_valid == 0){

			if(clk%50 == 0){
				std::cout << ns << std::endl;
				 ROS_WARN("====Missing Goal====");
			}

			setStart();
		}
		if(path_length > 0){
			
			ROS_INFO("Start solving trajectory...");
			start.pos << path_points_x[0], path_points_y[0], 5;
			goal.pos << path_points_x[path_length-1], path_points_y[path_length-1], 5;
			double total_dist = (start.pos - goal.pos).norm();
			double avg_v = 0.4;
			double total_time = (total_dist / avg_v);

			for(unsigned int k=2; k < path_length; k++){
				if(k < path_length-1 && (k%int(path_length/10) == 0 || k == path_length-1)){
					trajectory_profile p1, p2;
					p1.pos << path_points_x[k], path_points_y[k], 5;
			
					p2.pos << path_points_x[k+1], path_points_y[k+1], 5;

					// std::cout << p1.pos << std::endl;
					double dist = (p1.pos - p2.pos).norm();

					// Time interval should be further adjust, small value will lead to qp failure
					double time_interval = (dist/total_dist) * total_time;
					
					path.push_back(segments(p1, p2, time_interval));
				}
			}
		
			std::cout << "Path size:" << path.size() << std::endl;
			data = plan.get_profile(path, path.size(), sample);

			ROS_INFO("Trajectory Planning finished, clearing path...");

			path_length = 0;
			path.clear();
		}
		else{
			if(clk%50 ==0) ROS_INFO("No path received...");
		}
		
		if(data.size() > 0){
			if((tick>data.size())) {

				vir_x = goal.pos(0);
				vir_y = goal.pos(1);
				vir_z = goal.pos(2);
				vx = 0;
				vy = 0;
				vz = 0;
				ax = 0;
				ay = 0;
				az = 0;

				error = sqrt(pow(uav_pos.point.x - vir_x,2) + pow(uav_pos.point.y - vir_y,2));
				if(error < 0.3 && path_valid == 1){
					ROS_WARN("====Reach Destination====");
					path_valid = 0;
				}
			} else {
				vir_x = data[tick].pos(0);
				vir_y = data[tick].pos(1);
				vir_z = 5;
				vx = data[tick].vel(0);
				vy = data[tick].vel(1);
				vz = data[tick].vel(2);
				ax = data[tick].acc(0);
				ay = data[tick].acc(1);
				az = data[tick].acc(2);
				tick++;

				double t = ros::Time::now().toSec();
				//std::cout << "time is " << t << std::endl;
			}

			//std::cout << "Tick: " << tick << ", data size: " << data.size() << std::endl;

			traj.transforms[0].translation.x = vir_x;
			traj.transforms[0].translation.y = vir_y;
			traj.transforms[0].translation.z = vir_z;
			traj.velocities[0].linear.x = vx;
			traj.velocities[0].linear.y = vy;
			traj.velocities[0].linear.z = vz;
			traj.accelerations[0].linear.x = ax;
			traj.accelerations[0].linear.y = ay;
			traj.accelerations[0].linear.z = az;
			traj.transforms[0].rotation.w = 0;
			traj.transforms[0].rotation.x = 0;
			traj.transforms[0].rotation.y = 0;
			traj.transforms[0].rotation.z = 0;

			traj_pub.publish(traj);
			
			if(tick == 1) ROS_INFO("Trajectory published...");			
		}
		
		clk++;
		if(clk>100) clk = 0;
		
		ros::spinOnce();
		loop_rate.sleep();
	}
	return;
}

void returnMode(geometry_msgs::PointStamped init_pos){
	std::string ns;
	std_msgs::Int8 msg;
	ns = ros::this_node::getNamespace();
	std::cout << ns << std::endl;
	ROS_WARN("====Returning====");

	// ROS_ERROR("PATH LENGTH: %d", path_length);
	const float DEG_2_RAD = M_PI / 180.0;
	double dt = 1000.0;
	ros::Rate loop_rate(dt);

	trajectory_msgs::MultiDOFJointTrajectoryPoint traj;

	geometry_msgs::Transform transform;
	geometry_msgs::Twist twist;

	transform.translation.x = init_pos.point.x;
	transform.translation.y = init_pos.point.y;
	transform.translation.z = 5;
	transform.rotation.x = 0;
	transform.rotation.y = 0;
	transform.rotation.z = 0;
	transform.rotation.w = 1;
	twist.linear.x = 0;
	twist.linear.y = 0;
	twist.linear.z = 0;
	twist.angular.x = 0;
	twist.angular.y = 0;
	twist.angular.z = 0;
	traj.transforms.push_back(transform);
	traj.velocities.push_back(twist);
	traj.accelerations.push_back(twist);

	while(ros::ok()){
		error = sqrt(pow(uav_pos.point.x - init_pos.point.x,2) + pow(uav_pos.point.y - init_pos.point.y,2));
		if(error < 0.3) break;
		traj_pub.publish(traj);
		ros::spinOnce();
		loop_rate.sleep();
	}

	msg.data = 0;
	mode_pub.publish(msg);
	return;

}

void aprilTagMode(){
	std::string ns;
	ns = ros::this_node::getNamespace();
	std::cout << ns << std::endl;
	ROS_WARN("====Entering April Tag Mode====");
	trajectory_msgs::MultiDOFJointTrajectoryPoint traj;
	geometry_msgs::Transform transform;
	geometry_msgs::Twist twist;
	double error_x = 0.0;
	double error_y = 0.0;
	double error_norm=0.0;
	double dt = 100.0;
	transform.translation.x = uav_pos.point.x;
	transform.translation.y = uav_pos.point.y;
	transform.translation.z = 5;
	transform.rotation.x = 0;
	transform.rotation.y = 0;
	transform.rotation.z = 0;
	transform.rotation.w = 1;
	twist.linear.x = 0;
	twist.linear.y = 0;
	twist.linear.z = 0;
	twist.angular.x = 0;
	twist.angular.y = 0;
	twist.angular.z = 0;

	traj.transforms.push_back(transform);
	traj.velocities.push_back(twist);
	traj.accelerations.push_back(twist);
	traj_pub.publish(traj);
	while(ros::ok()){ 
		//calculate position error between uav and apriltag
		error_x=apriltag_pose.pose.position.x;
		error_y=apriltag_pose.pose.position.y;
		error_norm=error_x*error_x+error_y*error_y;
		std::cout <<"error_norm="<< error_norm<<std::endl;
		
		if(error_norm<0.3){
			//error < 0.3 uav stay in the previous position
			traj.transforms[0].translation.x = uav_pos.point.x;
			traj.transforms[0].translation.y = uav_pos.point.y;
		}
		else{
			//tracking point = uav position + apriltag position 
			traj.transforms[0].translation.x =uav_pos.point.x-0.3*error_y;
			//y-axis in camera frame is convert in world frame 
			traj.transforms[0].translation.y =uav_pos.point.y-0.3*error_x;
		}
		traj_pub.publish(traj);

		ros::spinOnce();
		ros::Rate loop_rate(dt);
		loop_rate.sleep();
	}
	return;
}

void trackingMode(){
	std::string ns;
	std_msgs::Int8 msg;
	int t{0};

	ns = ros::this_node::getNamespace();
	std::cout << ns << std::endl;
	ROS_WARN("====Entering Tracking Mode====");

	trajectory_msgs::MultiDOFJointTrajectoryPoint traj;

	geometry_msgs::Transform transform;
	geometry_msgs::Twist twist;

	transform.translation.x = track_pos.x;
	transform.translation.y = track_pos.y;
	transform.translation.z = 5;
	transform.rotation.x = 0;
	transform.rotation.y = 0;
	transform.rotation.z = 0;
	transform.rotation.w = 1;
	twist.linear.x = 0;
	twist.linear.y = 0;
	twist.linear.z = 0;
	twist.angular.x = 0;
	twist.angular.y = 0;
	twist.angular.z = 0;

	traj.transforms.push_back(transform);
	traj.velocities.push_back(twist);
	traj.accelerations.push_back(twist);
	traj_pub.publish(traj);

	while(ros::ok()){
		t++;
		if(t % 20 == 0){
			traj.transforms[0].translation.x = track_pos.x;
			traj.transforms[0].translation.y = track_pos.y;
			traj_pub.publish(traj);
		}
		if(sqrt(pow(uav_pos.point.x - target_pos.x,2) + pow(uav_pos.point.y - target_pos.y,2)) < 0.5){
			ROS_WARN("====Target Tracked====");
			msg.data = 0;
			mode_pub.publish(msg);
			break;
		}
		ros::spinOnce();
		ros::Rate loop_rate(100);
		loop_rate.sleep();
	}
	return;
}

int main(int argc, char **argv)
{	
	std::string ns;
	ros::init(argc, argv, "geo");
	ros::NodeHandle nh;
	traj_pub= nh.advertise<trajectory_msgs::MultiDOFJointTrajectoryPoint>("desired_trajectory", 10);
	goal_pub = nh.advertise<geometry_msgs::PoseStamped>("move_base_simple/goal",1000);
	mode_pub = nh.advertise<std_msgs::Int8>("mode",1);
	start_pose_pub = nh.advertise<geometry_msgs::PoseWithCovarianceStamped>("initialpose",1 );
	wpSub = nh.subscribe("sPath", 1, pathCallback);
	ros::Subscriber apritag_Sub = nh.subscribe("/tag_detections", 10, apriltagCallback);
	UAV_pos_sub = nh.subscribe("odometry_sensor1/position", 1, uavPosCallback);
	ugv_sub = nh.subscribe("/ground_truth/state", 1, ugvPosCallback);
	mode_sub = nh.subscribe("mode", 1, modeCallback);
	target_sub = nh.subscribe("/target_pos", 1, targetCallback);
	track_sub = nh.subscribe("/track_pos", 1, trackCallback);

	double dt = 10.0;
	ros::Rate loop_rate(dt);
	int clk1 = 0;

	ns = ros::this_node::getNamespace();
	while(ros::ok()){
		ros::spinOnce();
		if(clk1%100 == 0){
			std::cout << ns << std::endl;
			ROS_ERROR("====Please Set Mode====");
		}

		if(mode == 1){

			aprilTagMode();
			std::cout << ns << std::endl;
			ROS_WARN("====Quitting April Tag Mode====");


		}else if(mode == 2){
			manualGoalMode();
			ROS_WARN("====Quitting Manual Goal Mode====");
	

		}else if(mode == 3){

			returnMode(ugv_pos);
			std::cout << ns << std::endl;
			ROS_WARN("====Quitting Reset Mode====");
			mode = 0;

		}else if(mode == 4){
			trackingMode();
			std::cout << ns << std::endl;
			ROS_WARN("====Quitting Tracking Mode====");
			mode = 0;
		}
		loop_rate.sleep();
		clk1++;
	}

}
