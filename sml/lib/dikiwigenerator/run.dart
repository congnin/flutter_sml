import 'package:flutter/material.dart';
import 'package:flutter_app/dikiwigenerator/feature/presentation/widgets/weather_forecast_widget.dart';
import 'package:flutter_app/dikiwigenerator/injector.dart';

void main() {
  Injector.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: WeatherForecastWidget(),
        ),
      ),
    );
  }
}
