import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//https://medium.com/flutter-community/a-deep-dive-into-stack-in-flutter-3264619b3a77
class SimpleDemoStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Max Size
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
          height: 300.0,
          width: 300.0,
        ),
        Container(
          color: Colors.pink,
          height: 150.0,
          width: 150.0,
        ),
      ],
    );
  }
}

class AlignDemoStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Max Size
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
          height: 300.0,
          width: 300.0,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            color: Colors.pink,
            height: 150.0,
            width: 150.0,
          ),
        ),
      ],
    );
  }
}

class PositionedDemoStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Max Size
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
          height: 300.0,
          width: 300.0,
        ),
        Positioned(
          right: 40.0,
          top: 40.0,
          child: Container(
            color: Colors.pink,
            height: 150.0,
            width: 150.0,
          ),
        ),
      ],
    );
  }
}

class IndexedDemoStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: 1,
      children: <Widget>[
        // Max Size
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
          height: 300.0,
          width: 300.0,
        ),
        Container(
          color: Colors.pink,
          height: 150.0,
          width: 150.0,
        ),
      ],
      alignment: Alignment.topRight,
    );
  }
}

class DemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoPageState();
  }
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/newyork.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 48.0,
            left: 10.0,
            right: 10.0,
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "New York",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
