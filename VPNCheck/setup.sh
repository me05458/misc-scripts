#!/bin/bash
sudo chmod +x VPNcheck.sh
sudo touch /lib/systemd/system/VPNCheck.service
sudo cat setupdata > /lib/systemd/system/VPNCheck.service
sudo systemctl daemon-reload
sudo systemctl enable VPNCheck
echo "All done!"
