import 'package:flutter/material.dart';

import 'main_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Layout Demo'),
          ),
          body: Builder(
            builder: (context) {
              return SafeArea(child: MainPage());
            },
          ),
        ));
  }
}
