import 'package:flutter_app/dikiwigenerator/feature/domain/entities/forecast.dart';
import 'package:flutter_app/dikiwigenerator/feature/domain/entities/location.dart';

abstract class ForecastRepository {
  Future<List<Forecast>> getFiveDayForecast(Location location);
}
