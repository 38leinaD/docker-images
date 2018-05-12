FROM 38leinad/was-9:latest

USER was
COPY jdbc.py /work/
COPY ojdbc7.jar postgresql-9.4.1209.jar /opt/

RUN /work/configure.sh /work/jdbc.py

CMD ["/work/start_server_with_deploy_monitor"]