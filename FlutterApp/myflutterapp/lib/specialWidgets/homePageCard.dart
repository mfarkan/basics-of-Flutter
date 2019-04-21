import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  final String route;
  final String header;
  HomePageCard(this.route, this.header);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onDoubleTap: () => Navigator.pushNamed(context, route),
      child: new Container(
        alignment: Alignment.center,
        child: new Text('''Double Click
              Go To $header Page '''),
      ),
    );
  }
}
