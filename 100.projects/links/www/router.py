from flask import request,render_template

@app.route('/', methods=['GET', 'POST'])
def home():
    return render_template('home.html')