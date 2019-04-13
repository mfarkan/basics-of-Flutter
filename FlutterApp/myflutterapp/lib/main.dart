import 'package:flutter/material.dart';
import './screens/rows.dart';
import './screens/firstPage.dart';
import './screens/hello.dart';
import './screens/columns.dart';
import './screens/scaffold.dart';
import './screens/statelessOrFull.dart';

void main() {
  runApp(new MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => new ScaffoldBasics(),
      '/first-page': (context) => new MyHomePage(),
      '/hello': (context) => new HelloWorld(),
      '/WithState': (context) => new WithState()
    },
  ));
}
