import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:flutter_app/weather_forecast/network/network.dart';
import 'package:flutter_app/weather_forecast/ui/bottom_view.dart';
import 'package:flutter_app/weather_forecast/ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "San Diego";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      MidView(snapshot: snapshot),
                      BottomView(snapshot: snapshot,)
                    ],
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) =>
      new Network().getWeatherForecast(cityName: _cityName);
}
