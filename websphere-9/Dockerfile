FROM ibmcom/websphere-traditional:9.0.0.6-install

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

CMD ["/work/start_server"]