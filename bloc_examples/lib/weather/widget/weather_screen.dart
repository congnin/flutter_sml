import 'dart:async';

import 'package:bloc_examples/weather/bloc/blocs.dart';
import 'package:bloc_examples/weather/bloc/weather_bloc.dart';
import 'package:bloc_examples/weather/widget/last_updated.dart';
import 'package:bloc_examples/weather/widget/location.dart';
import 'package:bloc_examples/weather/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'city_selection.dart';
import 'combined_weather_temperature.dart';

class WeatherScreen extends StatefulWidget {
  State<WeatherScreen> createState() => _WeatherState();
}

class _WeatherState extends State<WeatherScreen> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitySelection(),
                ),
              );
              if (city != null) {
                BlocProvider.of<WeatherBloc>(context)
                    .add(FetchWeather(city: city));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherLoaded) {
              BlocProvider.of<ThemeBloc>(context).add(
                WeatherChanged(condition: state.weather.condition),
              );
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
            }
          },
          builder: (context, state) {
            if (state is WeatherLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoaded) {
              final weather = state.weather;

              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, themeState) {
                  return GradientContainer(
                    color: themeState.color,
                    child: RefreshIndicator(
                      onRefresh: () {
                        BlocProvider.of<WeatherBloc>(context).add(
                          RefreshWeather(city: weather.location),
                        );
                        return _refreshCompleter.future;
                      },
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 100.0),
                            child: Center(
                              child: Location(location: weather.location),
                            ),
                          ),
                          Center(
                            child: LastUpdated(dateTime: weather.lastUpdated),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 50.0),
                            child: Center(
                              child: CombinedWeatherTemperature(
                                weather: weather,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (state is WeatherError) {
              return Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }
            return Center(child: Text('Please Select a Location'));
          },
        ),
      ),
    );
  }
}
