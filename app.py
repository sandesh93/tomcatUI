import subprocess
from flask import Flask, render_template,redirect, url_for, request
from subprocess import Popen, PIPE, STDOUT
 
app = Flask(__name__)
 
@app.route('/<string:page_name>/')
def render_static(page_name):
    return render_template('%s.html' % page_name)

@app.route('/')
def hello():
    return render_template('login.html')


# Route for handling the login page logic
@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        if request.form['username'] == 'admin' and request.form['password'] == 'admin':
            error = 'Login success!!!'
            return render_template('hello.html', error=error)
        else:
            error = 'Invalid Credentials. Please try again.'
            return render_template('login.html', error=error)
    return render_template('login.html', error=error)


@app.route('/stop', methods=['GET', 'POST'])
def stop():
    if request.method == 'POST':
       #subprocess.call(['./tmp/sandesh/scripts/Tomcat_Stop.sh'], shell=True)
	cmd="sh /tmp/sandesh/scripts/Tomcat_Stop.sh"
	#returned_value = subprocess.call(cmd, shell=True)  # returns the exit code in unix
	#print returned_value
        p=Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE, stderr=STDOUT, close_fds=True)
        output=p.stdout.read()
        return output
	#if returned_value == 0:
        #   #pirint ("Tomcat Stopped successfully!!!")
	#   return 'Tomcat Stopped successfully';
        #else:
       #     #print ("Error while shutting down tomcat!!")
        #    return 'Tomcat already stopped!!'
    #return(returned_value)

@app.route('/start', methods=['GET', 'POST'])
def start():
    if request.method == 'POST':
       #subprocess.call(['./tmp/sandesh/scripts/Tomcat_Stop.sh'], shell=True)
        cmd="sh /tmp/sandesh/scripts/Tomcat_Start.sh"
        #returned_value = subprocess.call(cmd, shell=True)  # returns the exit code in unix
        q=Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE, stderr=STDOUT, close_fds=True)
	output=q.stdout.read()
	return output
        #if returned_value == 0:
        #print ("Tomcat Started successfully!!!")
        #   return 'Tomcat started successfully !!'
        #else:
        #   #print ("Error in process startup!!!")
        #   return "Tomcat Already started!!!"
    #return(returned_value)



	  

if __name__ == '__main__':
    app.run(host='10.78.11.207', port=8443)

