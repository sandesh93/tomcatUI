#!/bin/bash

#Set Java Path
export JAVA_HOME=/usr/local/java/jre1.7.0_40/bin
export PATH=$PATH:$JAVA_HOME
Tomcat_Home=/usr/local/tomcat/apache-tomcat-7.0.39/

#Check the tomcat status
PID=$(ps -ef| grep tomcat | grep -v grep  | awk '{print $2}')

if [[ -z $PID ]]
then
	echo "Tomcat does not appear to be running . . ."
	echo "Stop aborted...!"
else
	echo "Tomcat is running with PID= "$PID
	#$(> $Tomcat_Home/logs/catalina.out)
	#cd $Tomcat_Home/bin;sh startup.sh
	#echo "waiting 10 seconds for tomcat startup..."
	#sleep 10
	#grep -ri "INFO: Server startup" $Tomcat_Home/logs/catalina.out
	PID=$(ps -ef| grep tomcat | grep -v grep  | awk '{print $2}')
	echo "Shutting down tomcat ...."
	$(sudo kill -9 $PID)
	sleep 3
	echo "Process shutdown successfully !!"
	#echo "Tomcat started successfully on PID="$PID
	#tail -f `$Tomcat_Home/logs/catalina.out` | while read LOGLINE
	#do
	#   [[ "${LOGLINE}" == "INFO: Server startup" ]] && pkill -P $$ tail
	#done

fi
