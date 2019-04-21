import 'package:flutter/material.dart';
import '../specialWidgets/homePageCard.dart';

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
              onPressed: () => {Navigator.pushNamed(context, '/first-page')},
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
            new GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/first-page'),
              child: new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          'https://storage.googleapis.com/material-design/publish/material_v_11/assets/0Bx4BSt6jniD7T0hfM01sSmRyTG8/layout_structure_regions_mobile.png'),
                      fit: BoxFit.cover),
                ),
                alignment: Alignment.bottomCenter,
                child: new Transform(
                  alignment: Alignment.bottomCenter,
                  transform: new Matrix4.skewY(0.0)..rotateZ(0),
                  child: new Container(
                    padding: EdgeInsets.all(8),
                    color: Color(0xFFA4B0BD),
                    child: new Text('One click Go To First Page'),
                  ),
                ),
              ),
            ),
            new GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/imageView'),
              child: new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/images/damlasulogo.png'),
                      fit: BoxFit.cover),
                ),
                alignment: Alignment.bottomCenter,
                child: new Transform(
                  alignment: Alignment.bottomCenter,
                  transform: new Matrix4.skewY(0.0)..rotateZ(0),
                  child: new Container(
                    padding: EdgeInsets.all(8),
                    color: Color(0xFFA4B0BD),
                    child: new Text('One click Go To First Page'),
                  ),
                ),
              ),
            ),
            new GestureDetector(
              onDoubleTap: () => Navigator.pushNamed(context, '/AlertText'),
              child: new Container(
                alignment: Alignment.center,
                child: new Text('''Double Click
              Go To Alert Page '''),
              ),
            ),
            new GestureDetector(
              onLongPress: () => Navigator.pushNamed(context, '/ToastSample'),
              child: new Container(
                alignment: Alignment.center,
                child: new Text('''Long Click
              Go To WithState Page'''),
              ),
            ),
            new Card(
              child: new GestureDetector(
                onDoubleTap: () =>
                    Navigator.pushNamed(context, '/SharedSettings'),
                child: new Container(
                  alignment: Alignment.center,
                  child: new Text('''Double Click
              Go To Shared Page '''),
                ),
              ),
            ),
            new GestureDetector(
              onDoubleTap: () => Navigator.pushNamed(context, '/FileMaker'),
              child: new Container(
                alignment: Alignment.center,
                child: new Text('''Double Click
              Go To FileMaker Page '''),
              ),
            ),
            new GestureDetector(
              onDoubleTap: () => Navigator.pushNamed(context, '/HttpBasics'),
              child: new Container(
                alignment: Alignment.center,
                child: new Text('''Double Click
              Go To httpBasics Page '''),
              ),
            ),
            new GestureDetector(
              onDoubleTap: () => Navigator.pushNamed(context, '/FlashLight'),
              child: new Container(
                alignment: Alignment.center,
                child: new Text('''Double Click
              Go To flashLight Page '''),
              ),
            ),
            HomePageCard('/HttpBasics', 'HttpHeader Page'),
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: 0,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.add),
            title: new Text("Add"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.delete),
            title: new Text("Delete"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.update),
            title: new Text("Update"),
          ),
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
