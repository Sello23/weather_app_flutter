import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_flutter/features/seacrh/data/model/Location.dart';

void main() {
  group('Location', () {
    group('fromJson', () {
      test('returns correct Location object', () {
        expect(
          Location.fromJson(
            <String, dynamic>{
              'name': 'Chicago',
              'lat': 41.85003,
              'lon': -87.65005,
              'country': 'GB',
              'state': 'England',
            },
          ),
          isA<Location>()
              .having((w) => w.name, 'name', 'Chicago')
              .having((w) => w.lat, 'lat', 41.85003)
              .having((w) => w.lon, 'lon', -87.65005)
              .having((w) => w.country, 'country', 'GB')
              .having((w) => w.state, 'state', 'England'),
        );
      });
    });
  });
}