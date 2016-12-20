#! /bin/bash
CONTAINER_NAME=u1604-throwable

lxc stop $CONTAINER_NAME
lxc delete $CONTAINER_NAME

lxc launch ubuntu:16.04 $CONTAINER_NAME

PACKAGES="bc libssl-dev zsh vim git make htop tree \
	  software-properties-common python-dev python-pip \
	  python3-dev python3-pip autoconf automake sed flex bison \
	  libtool liburcu-dev liburcu4 libelf-dev gcc ccache libpopt-dev \
	  uuid-dev pkg-config libxml2-dev libglib2.0-dev swig libdwarf-dev \
	  libdw-dev"

echo "#####################"
echo "#   Provisionning   #"
echo "#####################"
sleep 5
lxc exec $CONTAINER_NAME -- apt update
lxc exec $CONTAINER_NAME -- apt upgrade -y
lxc exec $CONTAINER_NAME -- apt install -y $PACKAGES
lxc exec $CONTAINER_NAME -- pip3 install vlttng

echo ""
echo "lxc exec $CONTAINER_NAME -- zsh"
