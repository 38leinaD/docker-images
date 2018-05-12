FROM jboss/wildfly:10.1.0.Final

USER root
RUN yum -y install nc && yum clean all
COPY wait-for /usr/local/bin/

USER jboss
COPY ojdbc7.jar postgresql-9.4.1209.jar /tmp/
COPY jboss.cli /tmp/

RUN $JBOSS_HOME/bin/jboss-cli.sh --file=/tmp/jboss.cli
RUN rm -rf $JBOSS_HOME/standalone/configuration/standalone_xml_history/current/

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]