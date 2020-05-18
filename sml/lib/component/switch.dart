import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: SwitchApp()));
}

class SwitchApp extends StatefulWidget {
  @override
  _switch createState() => new _switch();
}

class _switch extends State<SwitchApp> {
  bool swBool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Slider App'),
      ),
      body: Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CupertinoSwitch(
              value: swBool,
              onChanged: (bool sw) {
                setState(() {
                  swBool = sw;
                });
              })
        ],
      )),
    );
  }
}
