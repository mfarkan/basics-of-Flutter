import 'package:flutter/material.dart';

class ScaffoldBasics extends StatelessWidget {
  final _bgColor = const Color(0xFFA4B0BD);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: new Text('Welcome To My App'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () => print('Hello'),
              tooltip: 'Saving'),
          IconButton(
              icon: Icon(Icons.hearing),
              onPressed: () => print('Hello'),
              tooltip: 'Hearing'),
          IconButton(
            icon: Icon(Icons.healing),
            onPressed: () => print('Hello'),
            tooltip: 'Healing',
          ),
        ],
      ),
      body: new Container(
        child: new Center(
          child: new Text(
            'Hello Scaffold <3',
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: 0,
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.add), title: new Text("Add")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.delete), title: new Text("Delete")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.update), title: new Text("Update")),
        ],
        onTap: (int index) => print('$index'),
      ),
    );
  }
}
