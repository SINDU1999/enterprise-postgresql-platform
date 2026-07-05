from flask import Flask, render_template, request, redirect
from db import get_connection

app = Flask(__name__)


@app.route("/")
def index():
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SELECT * FROM employees ORDER BY id")

    employees = cur.fetchall()

    cur.close()
    conn.close()

    return render_template("index.html", employees=employees)


@app.route("/add", methods=["POST"])
def add_employee():
    name = request.form["name"]
    department = request.form["department"]

    conn = get_connection()
    cur = conn.cursor()

    cur.execute(
        "INSERT INTO employees (name, department) VALUES (%s, %s)",
        (name, department),
    )

    conn.commit()

    cur.close()
    conn.close()

    return redirect("/")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
