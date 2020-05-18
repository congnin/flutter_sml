import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/safeare_responsive/responsive_safe_area.dart';

void main() {
  runApp(MyApp2());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return getMyContainer(context);
          },
        ),
      ),
    );
  }
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return SafeArea(
              child: getMyContainer(context),
            );
          },
        ),
      ),
    );
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ResponsiveSafeArea(
          builder: (context, size) {
            return SafeArea(
              child: getMyContainer(context, height : size.height),
            );
          },
        ),
      ),
    );
  }
}

Container getMyContainer(BuildContext context, {double height}) {
  return Container(
    decoration: BoxDecoration(color: Colors.green.shade200),
    alignment: Alignment.topCenter,
    height: height ?? MediaQuery.of(context).size.height / 2,
    child: Column(
      children: [
        Text(
          "Let's get",
          style: Theme.of(context).textTheme.display1,
        ),
        Text(
          "RESPONSIVE",
          style: Theme.of(context).textTheme.display3,
        ),
      ],
    ),
  );
}