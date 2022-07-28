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


ros::Publisher traj_pub;

int main(int argc, char **argv)
{	
	std::string ns;
	ros::init(argc, argv, "manual_waypoints");
	ros::NodeHandle nh;
	traj_pub= nh.advertise<trajectory_msgs::MultiDOFJointTrajectoryPoint>("desired_trajectory", 10);

	double dt = 10.0;
	ros::Rate loop_rate(dt);
	int clk1 = 0;
	qptrajectory plan;
	path_def path;
	std::vector<trajectory_profile> data;
	trajectory_msgs::MultiDOFJointTrajectoryPoint traj;
	double sample = 0.05;

	geometry_msgs::Transform transform;
	geometry_msgs::Twist twist;

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
	std::vector<float> path_points_x{-6, -5, -4, -3, -2, -1, 0, 1, 1, 1, 1, 0, -1, -2, -3, -4, -5, -6};
	std::vector<float> path_points_y{-6, -6, -6, -6, -6, -6, -5, -4, -3, -2, -1, 0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5};

	for(unsigned int k=0; k < 18; k++){
		trajectory_profile p1, p2;
		p1.pos << path_points_x[k], path_points_y[k], 0;

		p2.pos << path_points_x[k+1], path_points_y[k+1], 0;

		// std::cout << p1.pos << std::endl;
		double dist = (p1.pos - p2.pos).norm();

		// Time interval should be further adjust, small value will lead to qp failure		
		path.push_back(segments(p1, p2, 0.7));
	}
		
	data = plan.get_profile(path, path.size(), sample);

	ROS_INFO("Trajectory Planning finished, clearing path...");
	path.clear();
	std::cout << data.size() << std::endl;
	for(int tick; tick <= data.size(); tick++){ 	

		vir_x = data[tick].pos(0);
		vir_y = data[tick].pos(1);
		vir_z = 2;
		vx = data[tick].vel(0);
		vy = data[tick].vel(1);
		vz = data[tick].vel(2);
		ax = data[tick].acc(0);
		ay = data[tick].acc(1);
		az = data[tick].acc(2);
		//std::cout << "time is " << t << std::endl;


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
		ros::spinOnce();
		loop_rate.sleep();
	}		

}
