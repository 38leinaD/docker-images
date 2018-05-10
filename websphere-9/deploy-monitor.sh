#!/bin/bash
# If i mount /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/monitoredDeployableApps/servers/server1 and there is already a WAR/EAR present at this time,
# websphere will not deploy it.
# It seems to only deploy applications that are copied here after the server has started the auto-deploy feature.
# This script makes sure this initial deployment is noticed by the server by updating the timestamp of the file.
set -e

PID=$1

echo "+ deploy-monitor: Waiting for SystemOut.log file beeing created."
while [ ! -f /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/logs/server1/SystemOut.log ]
do
  sleep 2
done

echo "+ deploy-monitor: Waiting for event CWLDD0002I."
tail -F /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/logs/server1/SystemOut.log --pid $1 -n +0 | grep -m 1 "CWLDD0002I"
echo "+ deploy-monitor: Event CWLDD0002I spotted."

cd /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/monitoredDeployableApps/servers/server1
find . -name "*.war" -exec touch {} \;
find . -name "*.ear" -exec touch {} \;
