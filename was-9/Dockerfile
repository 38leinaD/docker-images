FROM ibmcom/websphere-traditional:9.0.0.6-install

USER root

ENV PROFILE_NAME=$PROFILE_NAME \
  SERVER_NAME=$SERVER_NAME \
  ADMIN_USER_NAME=$ADMIN_USER_NAME

COPY create_profile configure.sh configure.py start_server_with_deploy_monitor deploy-monitor.sh /work/
RUN mkdir /work/config
RUN chown -R was:was /work  && \
  chmod u+x /work/configure.sh && \
  chmod u+x /work/configure.py && \
  chmod u+x /work/create_profile

#RUN apt-get install -y rlwrap

USER was

ARG PROFILE_NAME=AppSrv01
ARG CELL_NAME=DefaultCell01
ARG NODE_NAME=DefaultNode01
ARG HOST_NAME=localhost
ARG SERVER_NAME=server1
ARG ADMIN_USER_NAME=wsadmin

ENV PROFILE_NAME=$PROFILE_NAME \
  SERVER_NAME=$SERVER_NAME \
  ADMIN_USER_NAME=$ADMIN_USER_NAME

RUN /work/create_profile
RUN mkdir -p /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/monitoredDeployableApps/servers/server1
RUN /work/configure.sh /work/configure.py

CMD ["/work/start_server_with_deploy_monitor"]