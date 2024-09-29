import '../../../../shared/weather_forecast_api_client.dart';
import '../../data/models/weather_data.dart';

class WeatherRepository {
  WeatherRepository({WeatherForecastApiClient? weatherForecastApiClient})
      : _weatherForecastApiClient =
            weatherForecastApiClient ?? WeatherForecastApiClient();

  final WeatherForecastApiClient _weatherForecastApiClient;

  Future<WeatherData> updateWeatherWithCity(String cityName) async {
    return await _weatherForecastApiClient.updateWeatherWithCity(
        cityName: cityName);
  }

  Future<WeatherData> updateWeatherWithCoordinates(
      double latitude, double longitude) async {
    return await _weatherForecastApiClient.updateWeatherWithCoordinates(
        latitude: latitude, longitude: longitude);
  }
}
