import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/weather_bloc.dart';
import 'repositories/weather_repository.dart';
import 'ui/weather_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: WeatherRepository()),
        child: WeatherPage(),
      ),
    );
  }
}
