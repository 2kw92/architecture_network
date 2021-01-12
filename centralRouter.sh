echo "net.ipv4.conf.all.forwarding=1" >> /etc/sysctl.conf
echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0 
nmcli connection modify "System eth1" +ipv4.addresses "192.168.254.1/30";
nmcli connection modify "System eth1" +ipv4.addresses "192.168.253.1/30"
echo "192.168.2.0/24 via 192.168.254.2 dev eth1" > /etc/sysconfig/network-scripts/route-eth1
echo "192.168.1.0/24 via 192.168.253.2 dev eth1" >> /etc/sysconfig/network-scripts/route-eth1
echo "GATEWAY=192.168.255.1" >> /etc/sysconfig/network-scripts/ifcfg-eth1
systemctl restart network
reboot