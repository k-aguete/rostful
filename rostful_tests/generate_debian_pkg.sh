#!/bin/bash

code_name=`lsb_release -sc`
ros_distro='indigo'

if [ $code_name == 'trusty' ];
then
    ros_distro='indigo'
    echo "setting up indigo"
elif [ $code_name == 'xenial' ];
then
    ros_distro='kinetic'
    echo "setting up kinetic"
else
    echo "Distro not supported"
    exit 1
fi
    
bloom-generate rosdebian --os-name ubuntu --os-version $code_name --ros-distro $ros_distro

fakeroot debian/rules binary
