import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Future Builder App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  String computeListOfTimestamps(int count) {
    StringBuffer sb = StringBuffer();
    for (int i = 0; i < count; i++) {
      sb.writeln("${i + 1} : ${DateTime.now()}");
    }
    return sb.toString();
  }

  Future<String> createFutureCalculation(int count) {
    return Future(() => computeListOfTimestamps(count));
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showCalculation = false;

  void _onInvokeFuturePressed() {
    setState(() => _showCalculation = !_showCalculation);
  }

  @override
  Widget build(BuildContext context) {
    Widget child = _showCalculation
        ? FutureBuilder(
            future: widget.createFutureCalculation(10000),
            builder: (context, snapshot) {
              return Expanded(
                child: SingleChildScrollView(
                  child: Text('${snapshot.data == null ? "" : snapshot.data}',
                      style: TextStyle(fontSize: 20.0)),
                ),
              );
            },
          )
        : Text('hit the button to show calculation');
    return Scaffold(
      appBar: AppBar(
        title: Text('Future'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[child],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onInvokeFuturePressed,
        tooltip: 'Invoke Future',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
