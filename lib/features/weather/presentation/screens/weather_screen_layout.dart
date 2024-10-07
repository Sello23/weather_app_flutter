import 'package:flutter/material.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather_data.dart';

class WeatherScreenLayout extends StatelessWidget {
  const WeatherScreenLayout({
    super.key,
    this.weatherData,
  });

  final WeatherData? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sunny_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
    );
  }
}
