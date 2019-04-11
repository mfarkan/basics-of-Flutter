import 'package:flutter/material.dart';
import './homePage/rows.dart';
import './homePage/firstPage.dart';
import './homePage/hello.dart';
import './homePage/columns.dart';
import './homePage/scaffold.dart';
import './homePage/statelessOrFull.dart';

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
