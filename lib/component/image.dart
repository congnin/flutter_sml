import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: ImageApp()));
}

class ImageApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _image();
}

class _image extends State<ImageApp> {
  bool checkBool = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Image App"),
      ),
      body: new Column(
        children: <Widget>[
          new Image.asset('images/newyork.jpg'),
          new Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
        ],
      ),
    );
  }
}