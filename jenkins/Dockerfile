FROM verigreen/jenkins:jenkins_v1.596.2-tomcat_v7.0.55-nginx_v1.7.12
MAINTAINER Ricardo Quintana http://github.com/rqc

RUN apt-get update && apt-get install -y \
										--fix-missing  \
										curl \
										unzip \
										bash \
										host \
										dnsutils \
										# supervisor \
										net-tools \
										&& \
										apt-get clean

ADD pre-entrypoint.sh $JENKINS_HOME/
ADD update_hosts.sh $JENKINS_HOME/
RUN chmod +x $JENKINS_HOME/pre-entrypoint.sh
RUN chmod +x $JENKINS_HOME/update_hosts.sh

CMD ./$JENKINS_HOME/pre-entrypoint.sh