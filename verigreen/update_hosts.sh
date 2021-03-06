# !/bin/bash

# Runs indefinitely updating the /etc/hosts entries 

cp /etc/hosts /etc/hosts.orig

forever_loop="0"
while [ "$forever_loop" -eq "0" ]
do
	docker0_ip=$(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}')
	echo "In $HOSTNAME: Updating Docker Bridge IP = $docker0_ip"
	gitlab_ip="$docker0_ip"
	jenkins_ip="$docker0_ip"
	cp /etc/hosts.orig /etc/hosts.temp
	echo "$gitlab_ip	$GITLAB_CONTAINER_HOSTNAME" | tee -a /etc/hosts.temp
	echo "$jenkins_ip	$JENKINS_CONTAINER_HOSTNAME" | tee -a /etc/hosts.temp
	cp /etc/hosts.temp /etc/hosts
	rm -rf /etc/hosts.temp
	sleep 60
done