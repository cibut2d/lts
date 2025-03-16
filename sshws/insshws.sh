#!/bin/bash
#installer Websocker tunneling 

cd
apt install python -y

#Install Script Websocket-SSH Python
wget -O /usr/local/bin/edu-proxy https://raw.githubusercontent.com/cibut2d/lts/main/sshws/openssh.py
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/cibut2d/lts/main/sshws/dropbear-ws.py
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/cibut2d/lts/main/sshws/ws-stunnel.txt
#wget -O /usr/local/bin/edu-proxyovpn https://raw.githubusercontent.com/cibut2d/lts/main/sshws/ovpn.py

#izin permision
chmod +x /usr/local/bin/edu-proxy
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
#chmod +x /usr/local/bin/edu-proxyovpn


#System OpenSSH Websocket-SSH Python
wget -O /etc/systemd/system/edu-proxy.service https://raw.githubusercontent.com/cibut2d/lts/main/sshws/http.service && chmod +x /etc/systemd/system/edu-proxy.service

#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/cibut2d/lts/main/sshws/service-wsdropbear.txt && chmod +x /etc/systemd/system/ws-dropbear.service

#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/cibut2d/lts/main/sshws/ws-stunnel.service.txt && chmod +x /etc/systemd/system/ws-stunnel.service

##System Websocket-OpenVPN Python
#wget -O /etc/systemd/system/edu-proxyovpn https://raw.githubusercontent.com/cibut2d/tandui/main/sshws/ovpn.service && chmod +x /etc/systemd/system/ws-ovpn.service

#restart service
#
systemctl daemon-reload
#Enable & Start & Restart ws-openssh service
systemctl enable edu-proxy.service
systemctl start edu-proxy.service
systemctl restart edu-proxy.service

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-openssh service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

#Enable & Start ws-ovpn service
#systemctl enable edu-proxyovpn.service
#systemctl start edu-proxyovpn.service
#systemctl restart edu-proxyovpn.service
