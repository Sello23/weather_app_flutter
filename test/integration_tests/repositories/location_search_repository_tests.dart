import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_flutter/features/seacrh/data/model/Location.dart';
import 'package:weather_app_flutter/features/seacrh/domain/repositories/location_search_repository.dart';
import 'package:weather_app_flutter/shared/weather_forecast_api_client.dart';

class MockWeatherForecastApiClient extends Mock
    implements WeatherForecastApiClient {}

void main() {
  late LocationSearchRepository locationSearchRepository;
  late MockWeatherForecastApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockWeatherForecastApiClient();
    locationSearchRepository =
        LocationSearchRepository(weatherForecastApiClient: mockApiClient);
  });

  group('searchLocations', () {
    const query = 'London';
    final locationList = [
      const Location(
          name: "London",
          lat: 51.5073219,
          lon: -0.1276474,
          country: "GB",
          state: "England"),
      const Location(
          name: "City of London",
          lat: 51.5156177,
          lon: -0.0919983,
          country: "GB",
          state: "England"),
      const Location(
          name: "London",
          lat: 42.9832406,
          lon: -81.243372,
          country: "CA",
          state: "Ontario"),
      const Location(
          name: "Chelsea",
          lat: 51.4875167,
          lon: -0.1687007,
          country: "GB",
          state: "England"),
      const Location(
          name: "London",
          lat: 37.1289771,
          lon: -84.0832646,
          country: "US",
          state: "Kentucky"),
    ];

    test('returns a list of Locations on successful API call', () async {
      when(() => mockApiClient.searchLocations(query: any())).thenAnswer(
        (_) async => locationList,
      );

      final result = await locationSearchRepository.searchLocations(query);

      expect(result, locationList);
      verify(() => mockApiClient.searchLocations(query: query)).called(1);
    });

    test('throws an exception when API call fails', () async {
      when(() => mockApiClient.searchLocations(query: any()))
          .thenThrow(Exception('API error'));

      expect(() => locationSearchRepository.searchLocations(query),
          throwsException);
    });
  });
}
