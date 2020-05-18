import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: GridApp(),
  ));
}

class GridApp extends StatefulWidget {
  @override
  _gridApp createState() => new _gridApp();
}

class _gridApp extends State<GridApp> {
  List<int> items = new List();

  @override
  void initState() {
    for (int i = 0; i < 150; i++) {
      items.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: items.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.cyan,
              child: Padding(
                padding: EdgeInsets.all(20.0),
              ),
            );
          }),
    );
  }
}
