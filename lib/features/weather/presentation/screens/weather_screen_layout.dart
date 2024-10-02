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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Weather App"),
      ),
      body: Center(
        child:
            Column(),
      ),
    );
  }
}
