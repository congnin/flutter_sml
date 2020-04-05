import 'package:flutter/material.dart';
import 'package:flutter_app/dikiwigenerator/feature/domain/entities/forecast.dart';
import 'package:flutter_app/dikiwigenerator/feature/domain/usecases/get_forecast.dart';

class WeatherForecastChangeNotifier extends ChangeNotifier {
  final GetForecast _getForecastUsecase;

  WeatherForecastChangeNotifier(this._getForecastUsecase);

  Future<List<Forecast>> getForecast() async {
    return await _getForecastUsecase();
  }
}
