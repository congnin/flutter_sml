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
        children: <Widget>[Text("Element 1"), Text("Element 2")],
      ),
    );
  }
}

void main() {
  runApp(ListArray());
}

class ListArray extends StatefulWidget {
  @override
  listArrayApp createState() => listArrayApp();
}

class listArrayApp extends State<ListArray> {
  List<int> items = new List();

  @override
  void initState() {
    for (int i = 0; i < 50; i++) {
      items.add(i);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'List Array App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('List App with Array'),
          ),
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('List tile number: $index'),
                  trailing: Icon(Icons.access_alarm),
                );
              }),
        ));
  }
}

class listApp extends State<ListArray> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "List App",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Its a App Bar"),
        ),
        body: new ListView(
          children: <Widget>[
            new ListTile(
                title: new Text("List Title Nice"),
                trailing: new Icon(Icons.arrow_back)),
            new ListTile(
                title: new Text("Title Two"),
                trailing: new Icon(Icons.arrow_back_ios)),
            new ListTile(
              title: new Text("Title Three with Icon"),
              trailing: new Icon(Icons.arrow_downward),
            )
          ],
        ),
      ),
    );
  }
}
