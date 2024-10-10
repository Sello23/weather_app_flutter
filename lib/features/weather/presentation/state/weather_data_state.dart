import 'package:equatable/equatable.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather_data.dart';

import '../../../../shared/states/app_status.dart';

final class WeatherDataState extends Equatable {
  const WeatherDataState({
    this.status = AppStatus.loading,
    this.weatherData,
  });

  final AppStatus status;
  final WeatherData? weatherData;

  WeatherDataState copyWith({
    AppStatus? status,
    WeatherData? weatherData,
  }) {
    return WeatherDataState(
      status: status ?? this.status,
      weatherData: weatherData ?? this.weatherData,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.toString().split('.').last,
      'weatherData': weatherData?.toJson(),
    };
  }

  static WeatherDataState fromJson(Map<String, dynamic> json) {
    return WeatherDataState(
        status: AppStatus.values
            .firstWhere((e) => e.toString().split('.').last == json['status']),
        weatherData: json['weatherData']);
  }

  @override
  List<Object?> get props => [status, weatherData];
}
