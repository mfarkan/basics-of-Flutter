import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';

class FlashLight extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlashLightState();
  }
}

class _FlashLightState extends State<FlashLight> {
  bool _hasFlash = false;
  bool _isOn = false;
  double _intensity = 1.0; //this use in only IOS

  @override
  void initState() {
    // TODO: implement initState
    firstOpening();
    super.initState();
  }

  firstOpening() async {
    var hasFlash = await Lamp.hasLamp;
    print("device has flash ? $hasFlash");
    setState(() {
      this._hasFlash = hasFlash;
    });
  }

  changeIntensity(double value) async {
    setState(() {
      this._intensity = value;
    });
  }

  Future _turnFlash() async {
    _isOn ? Lamp.turnOff() : Lamp.turnOn(intensity: this._intensity);
    var hasFlash = await Lamp.hasLamp;
    setState(() {
      this._hasFlash = hasFlash;
      this._isOn = !this._isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flash Light'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/damlasulogo.png'),
          RaisedButton(
            child: Text('Open the flashlight'),
            onPressed: () {
              _turnFlash();
            },
          ),
          Slider(
            value: _intensity,
            min: 1.0,
            max: 10.0,
            label: 'Change Intensity <3',
            onChanged: (double value) {
              !_isOn ? changeIntensity(value) : null;
            },
          ),
        ],
      ),
    );
  }
}
