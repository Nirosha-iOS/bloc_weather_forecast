//Contains the business logic for the Weather feature, handles events, and updates the state accordingly.
import 'package:bloc/bloc.dart';
import 'weather_event.dart';
import 'weather_state.dart';
import '../repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
  }

  void _onFetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.fetchWeather(event.cityName);
      emit(WeatherLoaded(weather: weather));
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }
}
