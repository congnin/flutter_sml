import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

void main() {
  runApp(MaterialApp(home: AppBar()));
}

class AppBar extends StatefulWidget {
  @override
  _appBar createState() => _appBar();
}

class _appBar extends State<AppBar> {
  String mText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: prefix0.AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('App Bar'),
        elevation: 25.0,
        // Shadow effect in bottom
        titleSpacing: 75.0,
        // Space from start for app bar text
        toolbarOpacity: 0.5,
        // App bar opacity/ transparency
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                mText = 'Hello I am back arrow';
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                mText = 'Hello I want to close app';
              });
            },
          )
        ],
      ),
      body: Center(
        child: Text(mText),
      ),
    );
  }
}
