#!/bin/bash

code_name=`lsb_release -sc`
ros_distro='indigo'

if [ $code_name == 'trusty' ];
then
    ros_distro='indigo'
    echo "Setting up indigo version..."
elif [ $code_name == 'xenial' ];
then
    ros_distro='kinetic'
    echo "Setting up kinetic version..."
else
    echo "Distro not supported."
    exit 1
fi

sudo -H pip install pyjwt
sudo dpkg -i ros-"$ros_distro"-rostful_0.0.2-0"$code_name"_amd64.deb
sudo dpkg -i ros-"$ros_distro"-rostful-tests_1.0.1-0"$code_name"_amd64.deb

