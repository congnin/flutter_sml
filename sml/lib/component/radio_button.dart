import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: RadioButtonApp()));
}

class RadioButtonApp extends StatefulWidget {
  @override
  _radio createState() => new _radio();
}

class _radio extends State<RadioButtonApp> {
  int radioValue = 0;

  void radioMethod(value) {
    setState(() {
      radioValue = value;
      print(radioValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: radioValue,
              onChanged: (int rV) {
                radioMethod(rV);
              },
            ),
            Radio(
              value: 2,
              groupValue: radioValue,
              onChanged: (int rV) {
                radioMethod(rV);
              },
            ),
            Radio(
              value: 3,
              groupValue: radioValue,
              onChanged: (int rV) {
                radioMethod(rV);
              },
            )
          ],
        ),
      ),
    );
  }
}