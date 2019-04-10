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
      body: new Center(
        child: new GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            const Text('He\'d have you all unravel at the'),
            const Text('Heed not the rabble'),
            const Text('Sound of screams but the'),
            const Text('Who scream'),
            const Text('Revolution is coming...'),
            const Text('Revolution, they...'),
          ],
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
        onTap: (int index) {
          switch (index) {
            case 0:
              print('Tıkladığınız button add Butonudur.');
              break;
            case 1:
              print('Tıkladığınız button delete Butonudur.');
              break;
            case 2:
              print('Tıkladığınız button update Butonudur.');
              break;
            default:
              print('default');
              break;
          }
        },
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new Text('Murat Fatih ARKAN'),
              decoration: new BoxDecoration(
                color: Colors.blue,
              ),
            ),
            new ListTile(
              title: new Text('First Item of List'),
              subtitle: new Text('Subtitle of Item one'),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            new ListTile(
              trailing: Icon(Icons.arrow_forward),
              title: new Text('Second Item of List'),
              subtitle: new Text('Subtitle of Item two'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
