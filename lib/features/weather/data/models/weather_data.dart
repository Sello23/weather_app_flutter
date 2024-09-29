
import 'package:equatable/equatable.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather_forecast.dart';

import 'city.dart';

class WeatherData extends Equatable{
  final City city;
  final String cod;
  final double message;
  final int cnt;
  final List<WeatherForecast> list;

  const WeatherData({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: City.fromJson(json['city'] as Map<String, dynamic>),
      cod: json['cod'] as String,
      message: json['message'] as double,
      cnt: json['cnt'] as int,
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city.toJson(),
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': list.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
    city,
    cod,
    message,
    cnt,
    list,
  ];

}