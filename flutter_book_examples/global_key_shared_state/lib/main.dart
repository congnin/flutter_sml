import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final key = GlobalKey<_Widget1State>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Widget1(key: key),
              color: Colors.greenAccent,
            ),
            Container(
              child: Widget2(),
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class Widget1 extends StatefulWidget {
  Widget1({Key key}) : super(key: key);
  State createState() => new _Widget1State();
}

class _Widget1State extends State<Widget1> {
  String _state = 'some state';
  String get state => _state;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Widget1",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4),
            Text("State: $_state",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5)
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ));
  }
}

class Widget2 extends StatefulWidget {
  State createState() => new Widget2State();
}

class Widget2State extends State<Widget2> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Widget2",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display2),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                  child: new Text("Get state from Widget1"),
                  onPressed: () {
                    setState(() {
                      _text = key.currentState.state;
                    });
                  },
                )),
            Text("State: ${_text}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display1),
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ));
  }
}
