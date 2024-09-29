import 'dart:convert';
import 'package:http/http.dart' as http;
import '../features/seacrh/data/model/Location.dart';
import '../features/weather/data/models/Weather.dart';
import '../features/weather/data/models/weather_data.dart';
import 'app_strings.dart';

//Location
class LocationRequestFailure implements Exception {}

class LocationNotFoundFailure implements Exception {}

class WeatherForecastApiClient {
  WeatherForecastApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  /// Finds a [Location] `/direct?q=(query)&appid=(key)&limit=(number)`.
  Future<List<Location>> searchLocations({required String query}) async {
    final locationRequest = Uri.https(
      AppStrings.baseUrl,
      '/geo/1.0/direct',
      {'q': query, 'limit': 5, 'appid': AppStrings.apiKey},
    );

    final locationResponse = await _httpClient.get(locationRequest);

    if (locationResponse.statusCode != 200) {
      throw LocationRequestFailure();
    }

    final locationJson = jsonDecode(locationResponse.body) as List<dynamic>;
    if (locationJson.isEmpty) throw LocationNotFoundFailure();
    return locationJson
        .map((json) => Location.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Finds [WeatherData] `/daily?q=(city)&appid=(key)`.
  Future<WeatherData> updateWeatherWithCity({required String cityName}) async {
    final weatherRequest = Uri.https(
      AppStrings.baseUrl,
      '/daily',
      {'q': cityName, 'appid': AppStrings.apiKey, 'units': AppStrings.metric},
    );

    final weatherDataResponse = await _httpClient.get(weatherRequest);

    if (weatherDataResponse.statusCode != 200) {
      throw LocationRequestFailure();
    }

    final weatherDataJson =
        jsonDecode(weatherDataResponse.body) as Map<String, dynamic>;
    if (weatherDataJson.isEmpty) throw LocationNotFoundFailure();
    return WeatherData.fromJson(weatherDataJson);
  }

  /// Fetches [Weather] for a given [latitude] and [longitude].
  Future<WeatherData> updateWeatherWithCoordinates({
    required double latitude,
    required double longitude,
  }) async {

    final weatherRequest = Uri.https(
      AppStrings.baseUrl,
      '/daily',
      {
        'lat': latitude,
        'lon': longitude,
        'appid': AppStrings.apiKey,
        'units': AppStrings.metric
      },
    );

    final weatherDataResponse = await _httpClient.get(weatherRequest);

    if (weatherDataResponse.statusCode != 200) {
      throw LocationRequestFailure();
    }

    final weatherDataJson =
    jsonDecode(weatherDataResponse.body) as Map<String, dynamic>;
    if (weatherDataJson.isEmpty) throw LocationNotFoundFailure();
    return WeatherData.fromJson(weatherDataJson);
  }
}
