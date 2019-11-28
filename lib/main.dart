import 'package:flutter/material.dart';
import 'package:flutter_app/employeeList.dart';
import 'package:flutter_app/model/employee.dart';
import 'package:flutter_app/database/DbHelper.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "SQLite Database Example",
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new HomePage(title: "Home Page"),
    );
  }

}

class HomePage extends StatefulWidget{

  final String title;
  HomePage({Key key, this.title});

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }

}

class HomePageState extends State<HomePage> {

  Employee employee = new Employee("", "", "", "");

  String firstName, lastName, email, mobile;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text("Saving Employee"),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.view_list),
              tooltip: "View Employees",
              onPressed: () {
                navigateToEmployeeList();
              },
            )
          ],
        ),
        body:
        new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: "First Name"),
                  validator: (val) =>
                  val.length == 0 ? "Enter First Name" : null,
                  onSaved: (val) => this.firstName = val,
                ),
                new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Last Name'),
                  validator: (val) =>
                  val.length == 0 ? 'Enter LastName' : null,
                  onSaved: (val) => this.lastName = val,
                ),
                new TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(labelText: 'Mobile No'),
                  validator: (val) =>
                  val.length == 0 ? 'Enter Mobile No' : null,
                  onSaved: (val) => this.mobile = val,
                ),
                new TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(labelText: 'Email Id'),
                  validator: (val) =>
                  val.length == 0 ? 'Enter Email Id' : null,
                  onSaved: (val) => this.email = val,
                ),
                new Container(margin: const EdgeInsets.only(top: 10.0),
                  child: new RaisedButton(onPressed: submit,
                    child: new Text('Login'),),)

              ],
            ),
          ),
        )
    );
  }

  void submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    var employee = Employee(firstName, lastName, mobile, email);
    var dbHelper = DbHelper();
    dbHelper.saveEmployee(employee);
    showSnackBar("Data saved successfully");
  }


  void showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  void navigateToEmployeeList() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new EmployeeList()),
    );
  }

}