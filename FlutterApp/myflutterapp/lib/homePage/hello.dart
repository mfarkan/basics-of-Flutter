import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: new Container(
        margin: EdgeInsets.all(50),
        color: Colors.green,
        padding: EdgeInsets.all(50),
        child: new Container(
          color: Colors.blue,
          child: new Text(
            'Hello Again',
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
