lxc-ip
======

Get lxc container ip address 


Ruby script to get lxc container ip and connect with ssh\n

Usage: lxc-ip [options]

--help        To get this help

-n $NAME       To get ip of $NAME lxc container

-s $USER       Enter to container using ssh, is necessary the option -n before


if is not specified $USER variable by default will be "ubuntu"

Examples: 

ruby lxc-ip.rb -n container-name

ruby lxc-ip.rb -n container-name -s

ruby lxc-ip.rb -n container-name -s root
