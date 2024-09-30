import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather.dart';
import 'package:weather_app_flutter/features/weather/data/models/city.dart';
import 'package:weather_app_flutter/features/weather/data/models/coord.dart';
import 'package:weather_app_flutter/features/weather/data/models/feels_like.dart';
import 'package:weather_app_flutter/features/weather/data/models/temp.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather_data.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather_forecast.dart';
import 'package:weather_app_flutter/features/weather/domain/repositories/weather_data_repository.dart';
import 'package:weather_app_flutter/shared/weather_forecast_api_client.dart';

class MockWeatherForecastApiClient extends Mock
    implements WeatherForecastApiClient {}

void main() {
  late WeatherDataRepository weatherDataRepository;
  late MockWeatherForecastApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockWeatherForecastApiClient();
    weatherDataRepository =
        WeatherDataRepository(weatherForecastApiClient: mockApiClient);
  });

  group('updateWeatherWithCity', () {
    const weatherData = WeatherData(
      city: City(
        id: 993800,
        name: "Johannesburg",
        coord: Coord(
          lon: 28.0436,
          lat: -26.2023,
        ),
        country: "ZA",
        population: 2026469,
        timezone: 7200,
      ),
      cod: "200",
      message: 0.0553215,
      cnt: 7,
      list: [
        WeatherForecast(
          dt: 1727427600,
          sunrise: 1727409091,
          sunset: 1727453153,
          temp: Temp(
            day: 23.77,
            min: 14.06,
            max: 27.23,
            night: 19.75,
            eve: 24.68,
            morn: 14.55,
          ),
          feelsLike: FeelsLike(
            day: 22.44,
            night: 18.51,
            eve: 23.6,
            morn: 12.56,
          ),
          pressure: 1015,
          humidity: 9,
          weather: [
            Weather(
              id: 800,
              main: "Clear",
              description: "sky is clear",
              icon: "01d",
            ),
          ],
          speed: 6.56,
          deg: 219,
          gust: 11.95,
          clouds: 2,
          pop: 0,
          rain: null,
        ),
        WeatherForecast(
          dt: 1727514000,
          sunrise: 1727495424,
          sunset: 1727539578,
          temp: Temp(
            day: 25.2,
            min: 16.66,
            max: 28.07,
            night: 20.02,
            eve: 27.37,
            morn: 17.03,
          ),
          feelsLike: FeelsLike(
            day: 24.3,
            night: 19.28,
            eve: 26.25,
            morn: 15.55,
          ),
          pressure: 1011,
          humidity: 20,
          weather: [
            Weather(
              id: 501,
              main: "Rain",
              description: "moderate rain",
              icon: "10d",
            ),
          ],
          speed: 7.64,
          deg: 325,
          gust: 12.95,
          clouds: 28,
          pop: 0.75,
          rain: 1.73,
        ),
        WeatherForecast(
          dt: 1727600400,
          sunrise: 1727581757,
          sunset: 1727626004,
          temp: Temp(
            day: 25.3,
            min: 17.03,
            max: 29.21,
            night: 19.81,
            eve: 28.64,
            morn: 17.25,
          ),
          feelsLike: FeelsLike(
            day: 24.59,
            night: 18.42,
            eve: 27.11,
            morn: 16.49,
          ),
          pressure: 1008,
          humidity: 27,
          weather: [
            Weather(
              id: 500,
              main: "Rain",
              description: "light rain",
              icon: "10d",
            ),
          ],
          speed: 7.15,
          deg: 315,
          gust: 16.69,
          clouds: 2,
          pop: 0.68,
          rain: 0.35,
        ),
        WeatherForecast(
          dt: 1727686800,
          sunrise: 1727668091,
          sunset: 1727712429,
          temp: Temp(
            day: 19.58,
            min: 10.82,
            max: 22.47,
            night: 10.82,
            eve: 21.8,
            morn: 11.48,
          ),
          feelsLike: FeelsLike(
            day: 18.12,
            night: 8.38,
            eve: 20.24,
            morn: 9.88,
          ),
          pressure: 1010,
          humidity: 20,
          weather: [
            Weather(
              id: 803,
              main: "Clouds",
              description: "broken clouds",
              icon: "04d",
            ),
          ],
          speed: 7.2,
          deg: 203,
          gust: 10.47,
          clouds: 76,
          pop: 0,
          rain: null,
        ),
        WeatherForecast(
          dt: 1727773200,
          sunrise: 1727754424,
          sunset: 1727798855,
          temp: Temp(
            day: 12.73,
            min: 4.9,
            max: 17.14,
            night: 11.62,
            eve: 17.14,
            morn: 4.9,
          ),
          feelsLike: FeelsLike(
            day: 10.4,
            night: 9.15,
            eve: 15.14,
            morn: 0.74,
          ),
          pressure: 1017,
          humidity: 13,
          weather: [
            Weather(
              id: 800,
              main: "Clear",
              description: "sky is clear",
              icon: "01d",
            ),
          ],
          speed: 6.96,
          deg: 198,
          gust: 10.73,
          clouds: 0,
          pop: 0,
          rain: null,
        ),
        WeatherForecast(
          dt: 1727859600,
          sunrise: 1727840758,
          sunset: 1727885282,
          temp: Temp(
            day: 15.29,
            min: 7.58,
            max: 19.38,
            night: 13.54,
            eve: 19.38,
            morn: 7.58,
          ),
          feelsLike: FeelsLike(
            day: 13.76,
            night: 11.92,
            eve: 17.97,
            morn: 5.34,
          ),
          pressure: 1022,
          humidity: 34,
          weather: [
            Weather(
              id: 800,
              main: "Clear",
              description: "sky is clear",
              icon: "01d",
            ),
          ],
          speed: 4.9,
          deg: 2,
          gust: 9.02,
          clouds: 0,
          pop: 0,
          rain: null,
        ),
        WeatherForecast(
          dt: 1727946000,
          sunrise: 1727927093,
          sunset: 1727971708,
          temp: Temp(
            day: 17.77,
            min: 9.85,
            max: 22.1,
            night: 12.96,
            eve: 22.1,
            morn: 9.85,
          ),
          feelsLike: FeelsLike(
            day: 16.44,
            night: 11.67,
            eve: 20.76,
            morn: 8.53,
          ),
          pressure: 1024,
          humidity: 32,
          weather: [
            Weather(
              id: 800,
              main: "Clear",
              description: "sky is clear",
              icon: "01d",
            ),
          ],
          speed: 5.6,
          deg: 65,
          gust: 9.78,
          clouds: 6,
          pop: 0,
          rain: null,
        ),
      ],
    );

    test('returns a WeatherData on successful API call', () async {
      when(() => mockApiClient.updateWeatherWithCity(cityName: 'Johannesburg'))
          .thenAnswer((_) async => weatherData);

      final result =
          await weatherDataRepository.updateWeatherWithCity('Johannesburg');

      expect(result, weatherData);
      verify(() =>
              mockApiClient.updateWeatherWithCity(cityName: 'Johannesburg'))
          .called(1);
    });

    test('throws an exception when API call fails', () async {
      when(() => mockApiClient.updateWeatherWithCity(cityName: 'Johannesburg'))
          .thenThrow(Exception('API error'));

      expect(() => weatherDataRepository.updateWeatherWithCity('Johannesburg'),
          throwsException);
    });
  });

  group('updateWeatherWithCity', () {
    const weatherData = WeatherData(
      city: City(
        id: 993800,
        name: "Johannesburg",
        coord: Coord(
          lon: 28.0436,
          lat: -26.2023,
        ),
        country: "ZA",
        population: 2026469,
        timezone: 7200,
      ),
      cod: "200",
      message: 0.0553215,
      cnt: 7,
      list: [
        WeatherForecast(
          dt: 1727427600,
          sunrise: 1727409091,
          sunset: 1727453153,
          temp: Temp(
            day: 23.77,
            min: 14.06,
            max: 27.23,
            night: 19.75,
            eve: 24.68,
            morn: 14.55,
          ),
          feelsLike: FeelsLike(
            day: 22.44,
            night: 18.51,
            eve: 23.6,
            morn: 12.56,
          ),
          pressure: 1015,
          humidity: 9,
          weather: [
            Weather(
              id: 800,
              main: "Clear",
              description: "sky is clear",
              icon: "01d",
            ),
          ],
          speed: 6.56,
          deg: 219,
          gust: 11.95,
          clouds: 2,
          pop: 0,
          rain: null,
        ),
        WeatherForecast(
          dt: 1727514000,
          sunrise: 1727495424,
          sunset: 1727539578,
          temp: Temp(
            day: 25.2,
            min: 16.66,
            max: 28.07,
            night: 20.02,
            eve: 27.37,
            morn: 17.03,
          ),
          feelsLike: FeelsLike(
            day: 24.3,
            night: 19.28,
            eve: 26.25,
            morn: 15.55,
          ),
          pressure: 1011,
          humidity: 20,
          weather: [
            Weather(
              id: 501,
              main: "Rain",
              description: "moderate rain",
              icon: "10d",
            ),
          ],
          speed: 7.64,
          deg: 325,
          gust: 12.95,
          clouds: 28,
          pop: 0.75,
          rain: 1.73,
        ),
        WeatherForecast(
          dt: 1727600400,
          sunrise: 1727581757,
          sunset: 1727626004,
          temp: Temp(
            day: 25.3,
            min: 17.03,
            max: 29.21,
            night: 19.81,
            eve: 28.64,
            morn: 17.25,
          ),
          feelsLike: FeelsLike(
            day: 24.59,
            night: 18.42,
            eve: 27.11,
            morn: 16.49,
          ),
          pressure: 1008,
          humidity: 27,
          weather: [
            Weather(
              id: 500,
              main: "Rain",
              description: "light rain",
              icon: "10d",
            ),
          ],
          speed: 7.15,
          deg: 315,
          gust: 16.69,
          clouds: 2,
          pop: 0.68,
          rain: 0.35,
        ),
        WeatherForecast(
          dt: 1727686800,
          sunrise: 1727668091,
          sunset: 1727712429,
          temp: Temp(
            day: 19.58,
            min: 10.82,
            max: 22.47,
            night: 10.82,
            eve: 21.8,
            morn: 11.48,
          ),
          feelsLike: FeelsLike(
            day: 18.12,
            night: 8.38,
            eve: 20.24,
            morn: 9.88,
          ),
          pressure: 1010,
          humidity: 20,
          weather: [
            Weather(
              id: 803,
              main: "Clouds",
              description: "broken clouds",
              icon: "04d",
            ),
          ],
          speed: 7.2,
          deg: 203,
          gust: 10.47,
          clouds: 76,
          pop: 0,
          rain: null,
        ),
        WeatherForecast(
          dt: 1727773200,
          sunrise: 1727754424,
          sunset: 1727798855,
          temp: Temp(
            day: 12.73,
            min: 4.9,
            max: 17.14,
            night: 11.62,
            eve: 17.14,
            morn: 4.9,
          ),
          feelsLike: FeelsLike(
            day: 10.4,
            night: 9.15,
            eve: 15.14,
            morn: 0.74,
          ),
          pressure: 1017,
          humidity: 13,
          weather: [
            Weather(
              id: 800,
              main: "Clear",
              description: "sky is clear",
              icon: "01d",
            ),
          ],
          speed: 6.96,
          deg: 198,
          gust: 10.73,
          clouds: 0,
          pop: 0,
          rain: null,
        ),
        WeatherForecast(
          dt: 1727859600,
          sunrise: 1727840758,
          sunset: 1727885282,
          temp: Temp(
            day: 15.29,
            min: 7.58,
            max: 19.38,
            night: 13.54,
            eve: 19.38,
            morn: 7.58,
          ),
          feelsLike: FeelsLike(
            day: 13.76,
            night: 11.92,
            eve: 17.97,
            morn: 5.34,
          ),
          pressure: 1022,
          humidity: 34,
          weather: [
            Weather(
              id: 800,
              main: "Clear",
              description: "sky is clear",
              icon: "01d",
            ),
          ],
          speed: 4.9,
          deg: 2,
          gust: 9.02,
          clouds: 0,
          pop: 0,
          rain: null,
        ),
        WeatherForecast(
          dt: 1727946000,
          sunrise: 1727927093,
          sunset: 1727971708,
          temp: Temp(
            day: 17.77,
            min: 9.85,
            max: 22.1,
            night: 12.96,
            eve: 22.1,
            morn: 9.85,
          ),
          feelsLike: FeelsLike(
            day: 16.44,
            night: 11.67,
            eve: 20.76,
            morn: 8.53,
          ),
          pressure: 1024,
          humidity: 32,
          weather: [
            Weather(
              id: 800,
              main: "Clear",
              description: "sky is clear",
              icon: "01d",
            ),
          ],
          speed: 5.6,
          deg: 65,
          gust: 9.78,
          clouds: 6,
          pop: 0,
          rain: null,
        ),
      ],
    );

    test('returns a WeatherData on successful API call', () async {
      when(() => mockApiClient.updateWeatherWithCoordinates(
          latitude: -26.2023,
          longitude: 28.0436)).thenAnswer((_) async => weatherData);

      final result = await weatherDataRepository.updateWeatherWithCoordinates(
          -26.2023, 28.0436);

      expect(result, weatherData);
      verify(() => mockApiClient.updateWeatherWithCoordinates(
          latitude: -26.2023, longitude: 28.0436)).called(1);
    });

    test('throws an exception when API call fails', () async {
      when(() => mockApiClient.updateWeatherWithCoordinates(
          latitude: -26.2023,
          longitude: 28.0436)).thenThrow(Exception('API error'));

      expect(
          () =>
              weatherDataRepository.updateWeatherWithCoordinates(-26.2023, 28.0436),
          throwsException);
    });
  });
}
