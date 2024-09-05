import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherDetail extends StatelessWidget {
  final Weather weather;

  WeatherDetail(this.weather);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          '${weather.temperature}°C',
          style: TextStyle(fontSize: 42),
        ),
        SizedBox(height: 10),
        Text(
          weather.description.toUpperCase(),
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(Icons.air, size: 30),
                SizedBox(height: 5),
                Text('${weather.windSpeed} m/s'),
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.water_drop, size: 30),
                SizedBox(height: 5),
                Text('${weather.humidity}%'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
