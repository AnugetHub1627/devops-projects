from flask import Flask

# No spaces at the start of these lines
app = Flask(__name__)

@app.route("/")
def hello_world():
    # EXACTLY 4 SPACES here
    return "<h1>Hello, Devops! from anu...!!</h1>"

# No spaces at the start of these lines
if __name__ == "__main__":
    # EXACTLY 4 SPACES here
    app.run(host="0.0.0.0", port=8080, debug=True)
