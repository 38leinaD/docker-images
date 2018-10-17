FROM 38leinad/wildfly:14.0.0.Final

USER root
RUN yum -y install nc && yum clean all
COPY wait-for /usr/local/bin/

USER jboss
COPY ojdbc7_g.jar postgresql-9.4.1209.jar /tmp/
COPY jdbc.cli /tmp/

RUN $JBOSS_HOME/bin/jboss-cli.sh --file=/tmp/jdbc.cli
RUN rm -rf $JBOSS_HOME/standalone/configuration/standalone_xml_history/current/