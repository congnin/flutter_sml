import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: SliderApp()));
}

class SliderApp extends StatefulWidget {
  @override
  _slider createState() => new _slider();
}

class _slider extends State<SliderApp> {
  double sliderVal = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Slider(
                value: sliderVal,
                min: 1.0,
                max: 10.0,
                onChanged: (double dbVal) {
                  sliderMethod(dbVal);
                },
              ),
              Text('Slider value: $sliderVal')
            ],
          ),
        ));
  }

  void sliderMethod(double dbVal) {
    setState(() {
      sliderVal = dbVal;
      print(dbVal);
    });
  }
}
