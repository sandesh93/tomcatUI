#!/bin/bash

##Chnge Tomcat_Home as per your environment path
Tomcat_Home=/usr/local/tomcat/apache-tomcat-7.0.39/

#Check the tomcat status
PID=$(ps -ef| grep $Tomcat_Home | grep -v grep  | awk '{print $2}')

if [[ -z $PID ]]
then
	echo "Tomcat does not appear to be running . . ."
	echo "Stop aborted...!"
else
	echo "Tomcat is running with PID= "$PID
	PID=$(ps -ef| grep $Tomcat_Home | grep -v grep  | awk '{print $2}')
	echo "Shutting down tomcat ...."
	$(kill -9 $PID)
	sleep 3
	echo "Process shutdown successfully !!"
fi
