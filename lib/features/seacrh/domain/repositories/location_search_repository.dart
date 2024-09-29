import '../../../../shared/weather_forecast_api_client.dart';
import '../../../seacrh/data/model/Location.dart';

class LocationSearchRepository {
  LocationSearchRepository({WeatherForecastApiClient? weatherForecastApiClient})
      : _weatherForecastApiClient =
            weatherForecastApiClient ?? WeatherForecastApiClient();

  final WeatherForecastApiClient _weatherForecastApiClient;

  Future<List<Location>> searchLocations(String query) async {
    return await _weatherForecastApiClient.searchLocations(query: query);
  }
}
