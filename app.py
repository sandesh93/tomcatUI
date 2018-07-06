import subprocess
from flask import Flask, render_template,redirect, url_for, request
from subprocess import Popen, PIPE, STDOUT
import base64
 
app = Flask(__name__)
 
@app.route('/<string:page_name>/')
def render_static(page_name):
    return render_template('%s.html' % page_name)

@app.route('/')
def hello():
    #return render_template('login.html')
    return redirect(url_for('login'))


# Route for handling the login page logic
@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
	password = request.form['password']
	decodePassword = request.form['password'].decode('base64')
	#decodePassword = base64.b64decode(password)
        if request.form['username'] == 'admin' and decodePassword == 'Tomcat@123':
        #if request.form['username'] == 'admin' and request.form['password'] == 'admin':
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
	cmd="sh scripts/Tomcat_Stop.sh"
        p=Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE, stderr=STDOUT, close_fds=True)
        output=p.stdout.read()
        return output

@app.route('/start', methods=['GET', 'POST'])
def start():
    if request.method == 'POST':
       #subprocess.call(['./tmp/sandesh/scripts/Tomcat_Stop.sh'], shell=True)
        cmd="sh scripts/Tomcat_Start.sh"
        q=Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE, stderr=STDOUT, close_fds=True)
	output=q.stdout.read()
	return output

######Add host where appsone tomcat is running 
if __name__ == '__main__':
    app.run(host='10.78.11.207', port=8443)

