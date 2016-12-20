#! /bin/bash -e
CONTAINER_NAME=archlinux-throwable

lxc stop $CONTAINER_NAME || true
lxc delete $CONTAINER_NAME || true

lxc launch images:archlinux $CONTAINER_NAME

PACKAGES="bc zsh vim git make htop tree \
	  python python-pip bison flex autoconf \
	  gcc automake glib2 swig"

echo "#####################"
echo "#   Provisionning   #"
echo "#####################"
sleep 5
lxc exec $CONTAINER_NAME -- pacman -Syu --noconfirm $PACKAGES

echo ""
echo "lxc exec $CONTAINER_NAME -- zsh"
