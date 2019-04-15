import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SharedState();
  }
}

class SharedState extends State<SharedSettings> {
  final nameController = new TextEditingController();
  final lastNameController = new TextEditingController();
  final generalController = new GlobalKey<FormState>();
  String name = '';
  String lastName = '';
  int appNo = 0;
  bool status = false;
  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  void save(String name, String lastName) async {
    final references = await SharedPreferences.getInstance();
    if (this.generalController.currentState.validate()) {
      references.setBool('status', true);
      references.setInt('appNo', 1);
      references.setString('name', name);
      references.setString('lastName', lastName);

      Fluttertoast.showToast(
        msg: 'Successfuly <3',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  void getValues() async {
    final references = await SharedPreferences.getInstance();
    setState(() {
      name = references.getString('name');
      lastName = references.getString('lastName');
      status = references.getBool('status');
      appNo = references.getInt('appNo');
    });

    Fluttertoast.showToast(
      msg: 'Name:$name LastName: $lastName Status :$status AppNo:$appNo',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
    );
  }

  void delete() async {
    final references = await SharedPreferences.getInstance();
    references.remove('name');
    references.remove('lastName');
    references.remove('status');
    references.remove('appNo');

    setState(() {
      name = '';
      lastName = '';
      status = false;
      appNo = 0;
    });

    Fluttertoast.showToast(
      msg: 'Successfuly deleted <3',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shared Reference Example'),
      ),
      body: new Form(
        key: generalController,
        child: new Padding(
          padding: EdgeInsets.all(20),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please fill name field.';
                  }
                },
                controller: nameController,
                decoration: new InputDecoration(
                  hintText: 'Your name',
                ),
              ),
              new TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please fill lastname field.';
                  }
                },
                controller: lastNameController,
                decoration: new InputDecoration(
                  hintText: 'Your last name',
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Expanded(
                    child: new Padding(
                      padding: EdgeInsets.all(10),
                      child: new RaisedButton(
                        color: Colors.blue,
                        child: new Text(
                          'Save',
                          style: new TextStyle(color: Colors.white),
                        ),
                        onPressed: () => save(this.nameController.text,
                            this.lastNameController.text),
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Padding(
                      padding: EdgeInsets.all(10),
                      child: new RaisedButton(
                        color: Colors.green,
                        child: new Text(
                          'Get',
                          style: new TextStyle(color: Colors.white),
                        ),
                        onPressed: () => getValues(),
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Padding(
                      padding: EdgeInsets.all(10),
                      child: new RaisedButton(
                        color: Colors.red,
                        child: new Text(
                          'Delete',
                          style: new TextStyle(color: Colors.white),
                        ),
                        onPressed: () => delete(),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
