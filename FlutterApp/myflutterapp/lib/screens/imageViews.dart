import 'package:flutter/material.dart';

class ImageViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image View Examples'),
      ),
      body: new ListView(
        children: <Widget>[
          new Text(
            'Fade in Images',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          new FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image:
                'https://storage.googleapis.com/material-design/publish/material_v_11/assets/0Bx4BSt6jniD7T0hfM01sSmRyTG8/layout_structure_regions_mobile.png',
          ),
          new Text(
            'Assets Images',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          new Image.asset('assets/images/damlasulogo.png'),
          new Text(
            'Network Images',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          new Image.network(
              'https://storage.googleapis.com/material-design/publish/material_v_11/assets/0Bx4BSt6jniD7T0hfM01sSmRyTG8/layout_structure_regions_mobile.png'),
        ],
      ),
    );
  }
}
