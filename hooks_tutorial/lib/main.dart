import 'package:flutter/material.dart';

import 'home_page_with_hooks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
