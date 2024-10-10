import 'package:flutter/material.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather_data.dart';
import 'package:weather_app_flutter/shared/widgets/thumb_nail_image.dart';

import '../../data/models/weather_forecast.dart';
import 'package:intl/intl.dart';

class WeatherScreenLayout extends StatelessWidget {
  const WeatherScreenLayout({
    super.key,
    this.weatherData,
  });

  final WeatherData? weatherData;

  @override
  Widget build(BuildContext context) {
    WeatherForecast weatherForecast = weatherData!.list[0];

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/clear_background.png',
                    height: 420,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                _displayTodayWeather(weatherForecast),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 90,
                          child: Text(
                            "${weatherForecast.temp.min.round()}°\nmin",
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: Text(
                            "${weatherForecast.temp.day.round()}°\ncurrent",
                            style: const TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 37,
                          child: Text(
                            "${weatherForecast.temp.max.round()}°\nmax",
                            style: const TextStyle(
                                fontSize: 17, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                    child: Column(
                      children: weatherData!.list
                          .map((item) => _displayWeatherDetailRow(item))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _displayWeatherDetailRow(WeatherForecast weatherItem) {
    final imageUrl =
        "https://openweathermap.org/img/wn/${weatherItem.weather[0].icon}.png";
    var date = DateTime.fromMillisecondsSinceEpoch(weatherItem.dt * 1000);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            DateFormat.EEEE().format(date),
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
        ThumbNailImage(thumbnailUri: imageUrl),
        SizedBox(
          width: 30,
          child: Text(
            "${weatherItem.temp.day.round()}°",
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Positioned _displayTodayWeather(WeatherForecast weatherForecast) {
    return Positioned(
      top: 150,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "${weatherForecast.temp.day.round()}°",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 70.0),
            ),
            Text(
              weatherForecast.weather[0].main.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0),
            ),
          ],
        ),
      ),
    );
  }
}
