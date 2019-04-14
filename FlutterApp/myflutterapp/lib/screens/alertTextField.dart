import 'package:flutter/material.dart';

class AlertTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AlertTextState();
  }
}

class AlertTextState extends State<AlertTextField> {
  final _textController = TextEditingController();
  final _generalController = GlobalKey<FormState>();
  String _name;
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void sayHello() {
    if (this._generalController.currentState.validate()) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return new AlertDialog(
              title: new Text('Uyarı'),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text('Hi ${this._textController.text}'),
                    new Text('may the force be with you <3'),
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('It\'s Okey'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Text-Alert View Kullanımı'),
      ),
      body: new Form(
        key: _generalController,
        child: new Padding(
          padding: EdgeInsets.all(20),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please fill the text field.';
                  }
                  this._name = value;
                },
                controller: this._textController,
                decoration: InputDecoration(hintText: 'Enter your name'),
              ),
              new Padding(
                padding: EdgeInsets.all(20),
                child: new RaisedButton(
                  color: Colors.lime,
                  child: new Text('Hi'),
                  onPressed: () {
                    sayHello();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
