import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather_data.dart';

void main() {
  group('WeatherData', () {
    group('fromJson', () {
      test('returns correct WeatherData object', () {
        expect(
            WeatherData.fromJson(
              const <String, dynamic>{
                'city': <String, dynamic>{
                  'id': 993800,
                  'name': 'Johannesburg',
                  'coord': <String, dynamic>{
                    'lon': 28.0436,
                    'lat': -26.2023,
                  },
                  'country': 'ZA',
                  'population': 2026469,
                  'timezone': 7200,
                },
                'cod': '200',
                'message': 0.0553215,
                'cnt': 7,
                'list': [
                  <String, dynamic>{
                    'dt': 1727427600,
                    'sunrise': 1727409091,
                    'sunset': 1727453153,
                    'temp': <String, dynamic>{
                      'day': 23.77,
                      'min': 14.06,
                      'max': 27.23,
                      'night': 19.75,
                      'eve': 24.68,
                      'morn': 14.55,
                    },
                    'feels_like': <String, dynamic>{
                      'day': 22.44,
                      'night': 18.51,
                      'eve': 23.6,
                      'morn': 12.56,
                    },
                    'pressure': 1015,
                    'humidity': 9,
                    'weather': [
                      <String, dynamic>{
                        'id': 800,
                        'main': 'Clear',
                        'description': 'sky is clear',
                        'icon': '01d'
                      }
                    ],
                    'speed': 6.56,
                    'deg': 219,
                    'gust': 11.95,
                    'clouds': 2,
                    'pop': 0.75,
                    'rain': 1.73,
                  },
                ]
              },
            ),
            isA<WeatherData>()
                .having((s) => s.city.id, 'id', 993800)
                .having((s) => s.city.name, 'name', 'Johannesburg')
                .having((s) => s.city.coord.lon, 'lon', 28.0436)
                .having((s) => s.city.coord.lat, 'lat', -26.2023)
                .having((s) => s.city.country, 'country', 'ZA')
                .having((s) => s.city.population, 'population', 2026469)
                .having((s) => s.city.timezone, 'timezone', 7200)
                .having((s) => s.cod, 'cod', '200')
                .having((s) => s.message, 'message', 0.0553215)
                .having((s) => s.cnt, 'cnt', 7)
                .having((s) => s.list[0].dt, 'dt', 1727427600)
                .having((s) => s.list[0].sunrise, 'sunrise', 1727409091)
                .having((s) => s.list[0].sunset, 'sunset', 1727453153)
                .having((s) => s.list[0].temp.day, 'day', 23.77)
                .having((s) => s.list[0].temp.min, 'min', 14.06)
                .having((s) => s.list[0].temp.max, 'max', 27.23)
                .having((s) => s.list[0].temp.night, 'night', 19.75)
                .having((s) => s.list[0].temp.eve, 'eve', 24.68)
                .having((s) => s.list[0].temp.morn, 'morn', 14.55)
                .having((s) => s.list[0].feelsLike.day, 'day', 22.44)
                .having((s) => s.list[0].feelsLike.night, 'night', 18.51)
                .having((s) => s.list[0].feelsLike.eve, 'eve', 23.6)
                .having((s) => s.list[0].feelsLike.morn, 'morn', 12.56)
                .having((s) => s.list[0].pressure, 'pressure', 1015)
                .having((s) => s.list[0].humidity, 'humidity', 9)
                .having((s) => s.list[0].weather[0].id, 'id', 800)
                .having((s) => s.list[0].weather[0].main, 'main', 'Clear')
                .having((s) => s.list[0].weather[0].description, 'description',
                    'sky is clear')
                .having((s) => s.list[0].weather[0].icon, 'icon', '01d')
                .having((s) => s.list[0].speed, 'speed', 6.56)
                .having((s) => s.list[0].deg, 'deg', 219)
                .having((s) => s.list[0].gust, 'gust', 11.95)
                .having((s) => s.list[0].clouds, 'clouds', 2)
                .having((s) => s.list[0].pop, 'pop', 0.75)
                .having((s) => s.list[0].rain, 'rain', 1.73));
      });
    });
  });
}
