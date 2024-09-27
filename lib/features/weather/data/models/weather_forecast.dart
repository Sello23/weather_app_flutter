import 'package:equatable/equatable.dart';
import 'package:weather_app_flutter/features/weather/data/models/temp.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather.dart';

import 'feels_like.dart';

class WeatherForecast extends Equatable{
  final int dt;
  final int sunrise;
  final int sunset;
  final Temp temp;
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  final List<Weather> weather;
  final double speed;
  final int deg;
  final double gust;
  final int clouds;
  final int pop;

  const WeatherForecast({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.gust,
    required this.clouds,
    required this.pop,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      dt: json['dt'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
      temp: Temp.fromJson(json['temp'] as Map<String, dynamic>),
      feelsLike: FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      speed: json['speed'] as double,
      deg: json['deg'] as int,
      gust: json['gust'] as double,
      clouds: json['clouds'] as int,
      pop: json['pop'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dt': dt,
      'sunrise': sunrise,
      'sunset': sunset,
      'temp': temp.toJson(),
      'feels_like': feelsLike.toJson(),
      'pressure': pressure,
      'humidity': humidity,
      'weather': weather.map((e) => e.toJson()).toList(),
      'speed': speed,
      'deg': deg,
      'gust': gust,
      'clouds': clouds,
      'pop': pop,
    };
  }

  @override
  List<Object?> get props => [
    dt,
    sunrise,
    sunset,
    temp,
    feelsLike,
    pressure,
    humidity,
    weather,
    speed,
    deg,
    gust,
    clouds,
    pop
  ];

}