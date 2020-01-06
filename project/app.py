from flask import Flask, request, render_template, redirect
app = Flask(__name__)
from dada import student

@app.route('/')
def index() :
    return render_template("index.html")

@app.route("/student_call")
def student_call() :
    result = student.getStudent()
    #print(result)
    return render_template("student.html", object_list=result)

# ajax에 반응하는 회로
@app.route("/studentAct", methods=["GET","POST","PUT","DELETE"])
def studentAct():
    if request.method == 'GET':
        return student.getStudent()
    elif request.method == 'POST':
        name = request.form['name1']
        age  = request.form['age1']
        school = request.form['school1']
        cl_num = request.form['cl_num1']
        stuData = {'name' : name, 'age' : age, 'school' : school, 'cl_num' : cl_num}
        return  student.setStudent(stuData)

    elif request.method == 'DELETE':
        name = request.form['id']
        return  student.delStudent(name)

    elif request.method == 'PUT':
        stuData = request.form
        return student.putStudent(stuData)

if __name__ == '__main__':
    app.run()
