#include <iostream>
#include <ros/ros.h>
#include "std_msgs/Header.h"
#include "geometry_msgs/Quaternion.h"
#include "geometry_msgs/Vector3.h"
#include "sensor_msgs/Imu.h"

using namespace std;
sensor_msgs::Imu imu_trans;

void Callback(const sensor_msgs::Imu::ConstPtr &msg)
{
	imu_trans.header.seq = msg->header.seq;
	imu_trans.header.stamp = msg->header.stamp;
	imu_trans.header.frame_id = msg->header.frame_id;

	imu_trans.orientation_covariance = msg->orientation_covariance;
	imu_trans.angular_velocity_covariance = msg->angular_velocity_covariance;
	imu_trans.linear_acceleration_covariance = msg->linear_acceleration_covariance;
	
	imu_trans.orientation.x = msg->orientation.x;
	imu_trans.orientation.y = msg->orientation.y;
	imu_trans.orientation.z = msg->orientation.z;
	imu_trans.orientation.w = msg->orientation.w;
	
	imu_trans.angular_velocity.x = msg->angular_velocity.x;
	imu_trans.angular_velocity.y = msg->angular_velocity.y;
	imu_trans.angular_velocity.z = msg->angular_velocity.z;

	imu_trans.linear_acceleration.x = msg->linear_acceleration.y;
	imu_trans.linear_acceleration.y = - msg->linear_acceleration.x;
	imu_trans.linear_acceleration.z = msg->linear_acceleration.z - 9.81;
}

int main(int argc, char** argv)
{
	ros::init(argc, argv, "imu_coord_enu");
	ros::NodeHandle nh;

	ROS_INFO("Start tranfering");

	// Node setting
	ros::Publisher imu_enu;
	ros::Subscriber imu;

	ros::Rate r(1000);

	// Variable setting
	imu_enu = nh.advertise<sensor_msgs::Imu>("/iris1/imu/enu", 100);
	imu = nh.subscribe("/iris1/imu", 100, Callback);

	while (ros::ok())
	{
		
		imu_enu.publish(imu_trans);
	
		ros::spinOnce();
		r.sleep();
	}
	
	return 0;
}
