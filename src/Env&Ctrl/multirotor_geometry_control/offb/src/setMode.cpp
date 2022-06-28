#include <ros/ros.h>
#include <std_msgs/Int8.h>
#include <cstdio>

int main(int argc, char **argv){
    ros::init(argc, argv, "setMode");
	ros::NodeHandle nh;

    ros::Publisher mode_pub1 = nh.advertise<std_msgs::Int8>("/firefly1/mode",1 );
    ros::Publisher mode_pub2 = nh.advertise<std_msgs::Int8>("/firefly2/mode",1 );

    double dt = 10.0;
	ros::Rate loop_rate(dt);
    int c;
    std_msgs::Int8 mode;

    while(ros::ok()){
        ROS_WARN("====Please Set Mode====");

        c = getchar();

        if(c != EOF){
            switch(c){
                case 49: // key 1
                    mode.data = 1; // april tag hover mode
                    break;
                case 50: // key 2
                    mode.data = 2; // searching mode
                    break;
                case 114: // key r
                    mode.data = 3; // return to initial position
                    break;
                case 113: // key q
                    mode.data = 0;
            }
            ROS_WARN("Mode set to %d", mode.data);
            mode_pub1.publish(mode);
            mode_pub2.publish(mode);
        }
        
        ros::spinOnce();
		loop_rate.sleep();
    }

}