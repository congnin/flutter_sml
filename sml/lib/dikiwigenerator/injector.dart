import 'package:flutter_app/dikiwigenerator/feature/domain/usecases/get_forecast.dart';
import 'package:flutter_app/dikiwigenerator/feature/presentation/changenotifier/weather_forecast_changenotifier.dart';
import 'package:kiwi/kiwi.dart';

import 'feature/data/datasources/forecast_data_source.dart';
import 'feature/data/repositories/forecast_repository_impl.dart';
import 'feature/domain/entities/location.dart';
import 'feature/domain/repositories/forecast_repository.dart';

part 'injector.g.dart';

abstract class Injector {
  static Container container;

  static void setup() {
    container = Container();
    _$Injector()._configure();
  }

  // For use from classes trying to get top-level
  // dependencies such as ChangeNotifiers or BLoCs
  static final resolve = container.resolve;

  void _configure() {
    _configureWeatherForecastFeatureModuleModule();
  }

  //! WeatherForecastFeatureModule
  void _configureWeatherForecastFeatureModuleModule() {
    _configureWeatherForecastFeatureModuleInstances();
    _configureWeatherForecastFeatureModuleFactories();
  }

  void _configureWeatherForecastFeatureModuleInstances() {
    container.registerInstance(Location(latitude: 0, longitude: 0));
    container.registerInstance(
      Location(latitude: 51.5073, longitude: -0.1277),
      name: 'London',
    );
  }

  @Register.factory(WeatherForecastChangeNotifier)
  @Register.factory(GetForecast, resolvers: {Location: 'London'})
  @Register.factory(ForecastRepository, from: ForecastRepositoryImpl)
  @Register.factory(ForecastDataSource, from: FakeForecastDataSource)
  void _configureWeatherForecastFeatureModuleFactories();
}
