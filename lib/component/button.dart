import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: ButtonApp()));
}

class ButtonApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _button();
}

class _button extends State<ButtonApp> {
  String _text = '';

  void buttonMethod(value) {
    setState(() {
      _text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button App"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              buttonMethod('Raised Button was Pressed');
            },
            child: Text('Raised Button'),
          ),
          FlatButton(
            onPressed: () {
              buttonMethod('Flat Button was Pressed');
            },
            child: Text('Flat Button'),
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              buttonMethod('Icon Button was Pressed');
            },
          ),
          Text(_text),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(left: 16, bottom: 16),
                child: FloatingActionButton(
                  onPressed: () {
                    buttonMethod("FloatingActionButton was Pressed");
                  },
                  child: Icon(Icons.add_comment),
                  backgroundColor: Colors.deepPurple,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          buttonMethod("Extended FloatingActionButton was Pressed");
        },
        label: Text("Approve"),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
