import 'package:flutter/material.dart';

class RowsBasics extends StatelessWidget {
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
          child: new Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              new Container(
                color: Colors.purple,
                margin: EdgeInsets.all(5),
                child: new Text('Row',
                    textDirection: TextDirection.ltr),
              ),
              new Container(
                color: Colors.purple,
                margin: EdgeInsets.all(5),
                child: new Text('Row',
                    textDirection: TextDirection.ltr),
              )
            ],
          ),
        ),
      ),
    );
  }
}
