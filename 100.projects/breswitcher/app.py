#!/usr/bin/env python
# -*- coding: utf-8 -*-

'branch switcher'

__author__ = 'Remind Wang'


from flask import Flask, request, render_template,jsonify

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('index.html')

@app.route('/conf',methods=['POST'])
def saveConf():
	print 'save conf...'
	print request.get_json(force=False, silent=False, cache=True)
	mgmtportal = request.args.get('mgmtportal','fk')
	#mgmtportal = request.form['mgmtportal']
	#res = {'mgmtportal':mgmtportal}
	return jsonify({'resultCode':200,'resultMessage':'OK','result':mgmtportal})
	#return render_template('save-ok.html')

@app.route('/save-ok',methods=['GET'])
def saveOk():
	return render_template('save-ok.html')

@app.route('/save-error',methods=['GET'])
def saveFailed():
	return render_template('save-failed.html')

@app.route('/signin', methods=['GET'])
def signin_form():
    return render_template('form.html')

@app.route('/signin', methods=['POST'])
def signin():
    username = request.form['username']
    password = request.form['password']
    if username=='admin' and password=='password':
        return render_template('signin-ok.html', username=username)
    return render_template('form.html', message='Bad username or password', username=username)

if __name__ == '__main__':
    app.run(port=80)

