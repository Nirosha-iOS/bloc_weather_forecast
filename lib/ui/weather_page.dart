import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';
import 'weather_detail.dart';

class WeatherPage extends StatelessWidget {
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'City Name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    final cityName = cityController.text;
                    if (cityName.isNotEmpty) {
                      BlocProvider.of<WeatherBloc>(context)
                          .add(FetchWeather(cityName: cityName));
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitial) {
                  return Center(child: Text('Enter a city name'));
                } else if (state is WeatherLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is WeatherLoaded) {
                  return WeatherDetail(state.weather);
                } else if (state is WeatherError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
