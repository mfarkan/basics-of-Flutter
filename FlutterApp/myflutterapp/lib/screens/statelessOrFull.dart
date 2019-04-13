// uygulama boyunca değişmeyecek widgetlar stateless olarak adlandırılıyor mesela text gibi
//statefull ise duruma göre değişebilen widgetlar.
import 'package:flutter/material.dart';

class WithoutState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(
          primaryColor: Colors.blue,
        ),
        home: new WithState());
  }
}

class WithState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MySpecialState();
  }
}

class MySpecialState extends State<WithState> {
  num _count = 0;
  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  _decrementCount() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stateful Example'),
      ),
      body: new Center(
          child: new Column(
        children: <Widget>[
          new FlatButton(
            child: new Text('Increment Count'),
            onPressed: () {
              _incrementCount();
            },
          ),
          new Text(
            'Count of element ==> $_count',
            textDirection: TextDirection.ltr,
            style: new TextStyle(
                color: _count > 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold),
          ),
          new FlatButton(
            child: new Text('Decrement Count'),
            onPressed: () {
              _decrementCount();
            },
          )
        ],
      )),
    );
  }
}
