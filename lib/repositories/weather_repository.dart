import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherRepository {
  final String apiKey = '724d26652745343fb9641775ca44058e'; // API key from OpenWeatherMap
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather'; // Correct API endpoint

  Future<Weather> fetchWeather(String cityName) async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl?q=$cityName&appid=$apiKey&units=metric'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Weather.fromJson(data);
      } else {
        print('Error: ${response.body}');
        throw Exception('Failed to load weather data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception('Failed to load weather data: $e');
    }
  }
}
