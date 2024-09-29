import 'package:mocktail/mocktail.dart';
import 'package:weather_app_flutter/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app_flutter/shared/weather_forecast_api_client.dart';

class MockWeatherForecastApiClient extends Mock
    implements WeatherForecastApiClient {}

void main() {
  late WeatherRepository weatherRepository;
  late MockWeatherForecastApiClient mockApiClient;

}