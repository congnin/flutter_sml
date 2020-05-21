import 'package:auto_route/auto_route.dart';
import 'package:auto_route_tut/routes/router.gr.dart';
import 'package:flutter/material.dart';

class NestedScreenTwo extends StatelessWidget {
  final String message;

  const NestedScreenTwo({title, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text("Pop stack"),
          onPressed: () {
            ExtendedNavigator.ofRouter<Router>().pushLoginScreen();
          },
        ),
      ],
    );
  }
}