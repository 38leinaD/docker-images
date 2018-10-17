FROM jboss/wildfly:14.0.0.Final
RUN /opt/jboss/wildfly/bin/add-user.sh admin admin --silent
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "--server-config=standalone-full.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]