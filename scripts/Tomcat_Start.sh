#!/bin/bash

#Set Java Path
export JAVA_HOME=/usr/local/java/jre1.7.0_40/bin
export PATH=$PATH:$JAVA_HOME
Tomcat_Home=/usr/local/tomcat/apache-tomcat-7.0.39/

#Check the tomcat status
PID=$(ps -ef| grep tomcat | grep -v grep  | awk '{print $2}')

if [[ -z $PID ]]
then
	#echo -e "Tomcat does not appear to be running\n"
	echo -e "Attempting to start Tomcat process...\n"
	$(> $Tomcat_Home/logs/catalina.out)
	cd $Tomcat_Home/bin;sh startup.sh
	echo -e  "waiting for tomcat startup...\n"
	sleep 6
	grep -ri "INFO: Server startup" $Tomcat_Home/logs/catalina.out
	PID=$(ps -ef| grep tomcat | grep -v grep  | awk '{print $2}')
	echo -e "Tomcat started successfully on PID="$PID
	#tail -f `$Tomcat_Home/logs/catalina.out` | while read LOGLINE
	#do
	#   [[ "${LOGLINE}" == "INFO: Server startup" ]] && pkill -P $$ tail
	#done
else
	echo -e  "Tomcat is running already with PID="$PID
	echo -e "\nStart Aborted..!"
fi

