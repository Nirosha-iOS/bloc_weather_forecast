//Defines various events related to weather, such as fetching weather data.
import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String cityName;

  FetchWeather({required this.cityName});

  @override
  List<Object> get props => [cityName];
}
