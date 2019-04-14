import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: new Container(
        child: new FlatButton(
          child: new Text('Show Toast Message'),
          onPressed: () {
            Fluttertoast.showToast(
              msg: 'I\'m a Toast Message!',
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.blue,
              gravity: ToastGravity.CENTER,
            );
          },
        ),
      ),
    );
  }
}
