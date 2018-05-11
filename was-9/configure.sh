#!/bin/bash
set -e

PROFILE_NAME=${PROFILE_NAME:-"AppSrv01"}
SERVER_NAME=${SERVER_NAME:-"server1"}

start_server()
{
    echo "Starting server ..................."
    /opt/IBM/WebSphere/AppServer/profiles/$PROFILE_NAME/bin/startServer.sh $SERVER_NAME
}

stop_server()
{
    echo "Stopping server ..................."
    /opt/IBM/WebSphere/AppServer/profiles/$PROFILE_NAME/bin/stopServer.sh $SERVER_NAME
}

start_server
/opt/IBM/WebSphere/AppServer/bin/wsadmin.sh -lang jython -f $1
stop_server