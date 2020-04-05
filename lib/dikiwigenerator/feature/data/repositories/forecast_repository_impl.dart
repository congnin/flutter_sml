import 'package:flutter_app/dikiwigenerator/feature/data/datasources/forecast_data_source.dart';
import 'package:flutter_app/dikiwigenerator/feature/domain/entities/forecast.dart';
import 'package:flutter_app/dikiwigenerator/feature/domain/entities/location.dart';
import 'package:flutter_app/dikiwigenerator/feature/domain/repositories/forecast_repository.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastDataSource forecastDataSource;

  ForecastRepositoryImpl(this.forecastDataSource);

  @override
  Future<List<Forecast>> getFiveDayForecast(Location location) async {
    final forecastModelList =
        await forecastDataSource.getFiveDayForecast(location);
    return forecastModelList
        .map((forecastModel) => forecastModel.toEntity())
        .toList();
  }
}
