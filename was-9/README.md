# Websphere 9 Docker image

This is a docker-image configured for easy JavaEE 7 development. I.e. auto-deploy is enabled.

## Usage

Assuming you have a WAR/EAR under `~/junk/deploy`, the following will start the container and automatically deploy:

    docker run --name was9 --rm -p 9060:9060 -p 9080:9080 -p 7777:7777 -v ~/junk/deploy:/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/monitoredDeployableApps/servers/server1 38leinad/was:latest