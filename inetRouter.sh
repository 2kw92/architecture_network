bash -c 'echo "net.ipv4.conf.all.forwarding=1" >> /etc/sysctl.conf'
sysctl -p
yum install -y iptables-services
systemctl start iptables
iptables -F
iptables -t nat -A POSTROUTING ! -d 192.168.0.0/16 -o eth0 -j MASQUERADE
service iptables save
bash -c 'echo "192.168.0.0/16 via 192.168.255.2 dev eth1" > /etc/sysconfig/network-scripts/route-eth1'
systemctl restart network
reboot