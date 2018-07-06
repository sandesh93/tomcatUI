# tomcatUI
To perform Start/STop from UI 
OS: RedHat 6,7 and equivalant centos or unix version.

1) Clone this Repo where tomcat is running 
2) give permission 775 
3) Go to install packages offline flask-rpms folder and goto each folder run below command
==================
Dependency:

itsdangerous-0.24
MarkupSafe-0.23
Jinja2-2.7.3
Werkzeug-0.10.4
Flask-0.10.1
Run this command by going in everyfolder:     python setup.py install --record list.txt
========================
4) confirm if 8443 is free...or chnage port in app.py file (Note: Use any othre free port above 1024 as ports below 1024 are not accessible to normal user u need root or sudo access to run on lower port.)
5) confirm java and tomcat path if not default then change actual path 
