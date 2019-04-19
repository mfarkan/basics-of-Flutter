import 'package:flutter/material.dart';
import './screens/fileMaker.dart';
import './screens/sharedSettings.dart';
import './screens/toastMessage.dart';
import './screens/imageViews.dart';
import './screens/rows.dart';
import './screens/firstPage.dart';
import './screens/hello.dart';
import './screens/columns.dart';
import './screens/httpBasics.dart';
import './screens/scaffold.dart';
import './screens/statelessOrFull.dart';
import './screens/alertTextField.dart';

void main() {
  runApp(
    new MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => new ScaffoldBasics(),
        '/first-page': (context) => new MyHomePage(),
        '/hello': (context) => new HelloWorld(),
        '/WithState': (context) => new WithState(),
        '/imageView': (context) => new ImageViews(),
        '/ToastSample': (context) => new ToastSample(),
        '/AlertText': (context) => new AlertTextField(),
        '/SharedSettings': (context) => new SharedSettings(),
        '/FileMaker': (context) => new FileMaker(
              fileOutput: new FileOutput(),
            ),
        '/HttpBasics': (context) => new HttpBasics(),
      },
    ),
  );
}
