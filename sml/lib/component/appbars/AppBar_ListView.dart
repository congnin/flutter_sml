import 'package:flutter/material.dart';
import 'package:flutter_app/component/appbars/CategoryScreen.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit ',
      home: CategoryScreen(),
    );
  }
}
