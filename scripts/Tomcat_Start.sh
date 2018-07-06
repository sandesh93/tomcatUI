#!/bin/bash

#Set Java Path
#export JAVA_HOME=/usr/local/java/jre1.7.0_40/bin
#export PATH=$PATH:$JAVA_HOME
Tomcat_Home=/usr/local/tomcat/apache-tomcat-7.0.39/

#Check the tomcat status
PID=$(ps -ef| grep $Tomcat_Home | grep -v grep  | awk '{print $2}')

if [[ -z $PID ]]
then
	echo -e "Attempting to start Tomcat process...\n"
	$(> $Tomcat_Home/logs/catalina.out)
	cd $Tomcat_Home/bin;sh startup.sh
#	echo -e  "waiting for tomcat startup...\n"
	sleep 6
	grep -ri "INFO: Server startup" $Tomcat_Home/logs/catalina.out
	
	#tail -f $Tomcat_Home/logs/catalina.out | while read LOGINE
	# 	do 
	#[[ "${LOGLINE}" == *"INFO: Server startup"*]] && -P $$ tail
	#	done
	#	check=`$?`
#	(tail -f -n0 $Tomcat_Home/logs/catalina.out &) | grep -q "INFO: Server startup"
#       	if [[ $check -eq 0 ]] 
#	then 
		 PID=$(ps -ef| grep $Tomcat_Home | grep -v grep  | awk '{print $2}')
       		 echo "Tomcat started successfully with PID="$PID
		 echo "Please check \"catalina.out\" logs for verifying startup."
#	else
		#PID=$(ps -ef| grep tomcat | grep -v grep  | awk '{print $2}')
#		echo -e "Tomcat started successfully on PID=`$PID` however check tomcat catalina.out logs manuall for errors"
#	fi
else
	echo -e  "Tomcat is running already with PID="$PID
	echo -e "\nStart Aborted..!"
fi

