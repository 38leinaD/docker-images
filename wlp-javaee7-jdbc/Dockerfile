FROM websphere-liberty:javaee7

COPY ojdbc7.jar postgresql-9.4.1209.jar db-derby-10.14.2.0-lib/lib/derby.jar /opt/
COPY server.xml /config/
RUN server start && server stop && rm -rf /output/resources/security/ && rm -rf /output/messaging
