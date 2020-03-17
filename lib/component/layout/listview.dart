
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimplestListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is simplest listview"),
      ),
      body: ListView(
        children: <Widget>[
          Text("Element 1"),
          Text("Element 2")
        ],
      ),
    );
  }
}