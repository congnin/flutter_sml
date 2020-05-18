import 'package:bloc/bloc.dart';
import 'package:flutter_app/bloc_library/data/weather_repository.dart';

import 'bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository);

  @override
  WeatherState get initialState => WeatherInitial();

  // Under the hood, the Bloc library works with regular Dart Streams.
  // The "async*" makes this method an async generator, which outputs a Stream
  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    yield WeatherLoading();
    // Distinguish between different events, even though this app has only one
    if (event is GetWeather) {
      // Outputting a state from the asynchronous generator
      try {
        final weather = await weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield WeatherError("Couldn't fetch weather. Is the device online?");
      }
    } else if (event is GetDetailedWeather) {
      try {
        final weather =
            await weatherRepository.fetchDetailedWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError {
        yield WeatherError("Couldn't fetch weather. Is the device online?");
      }
    }
  }
}
