import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_flutter/features/weather/data/models/city.dart';
import 'package:weather_app_flutter/features/weather/data/models/coord.dart';
import 'package:weather_app_flutter/features/weather/data/models/feels_like.dart';
import 'package:weather_app_flutter/features/weather/data/models/temp.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather_data.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather_forecast.dart';
import 'package:weather_app_flutter/features/weather/domain/repositories/weather_data_repository.dart'
    as weather_data_repository;
import 'package:weather_app_flutter/features/weather/presentation/state/weather_data_cubit.dart';
import 'package:weather_app_flutter/features/weather/presentation/state/weather_data_state.dart';
import 'package:weather_app_flutter/shared/app_state.dart';
import 'package:weather_app_flutter/shared/location_exception.dart';

import '../../helpers/hydrated_bloc.dart';

class MockWeatherRepository extends Mock
    implements weather_data_repository.WeatherDataRepository {}

class MockWeatherData extends Mock implements WeatherData {}

var initialisedWeatherData = const WeatherData(
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

void main() {
  initialiseHydratedStorage();

  group('WeatherDataCubit', () {
    late WeatherData mockedWeatherData;
    late weather_data_repository.WeatherDataRepository
        mockedWeatherDataRepository;
    late WeatherDataCubit weatherDataCubit;

    setUp(() async {
      mockedWeatherData = MockWeatherData();
      mockedWeatherDataRepository = MockWeatherRepository();

      when(() => mockedWeatherData.city)
          .thenReturn(initialisedWeatherData.city);
      when(() => mockedWeatherData.cod).thenReturn(initialisedWeatherData.cod);
      when(() => mockedWeatherData.message)
          .thenReturn(initialisedWeatherData.message);
      when(() => mockedWeatherData.cnt).thenReturn(initialisedWeatherData.cnt);
      when(() => mockedWeatherData.list)
          .thenReturn(initialisedWeatherData.list);

      when(() => mockedWeatherData.toJson())
          .thenReturn(initialisedWeatherData.toJson());

      when(
        () => mockedWeatherDataRepository.updateWeatherWithCity(any()),
      ).thenAnswer((_) async => mockedWeatherData);

      when(
        () => mockedWeatherDataRepository.updateWeatherWithCoordinates(
            any(), any()),
      ).thenAnswer((_) async => mockedWeatherData);

      weatherDataCubit = WeatherDataCubit(mockedWeatherDataRepository);
    });

    test('initial state is correct', () {
      final weatherCubit = WeatherDataCubit(mockedWeatherDataRepository);
      expect(weatherCubit.state, const WeatherDataState());
    });

    group('toJson/fromJson', () {
      test('work properly', () {
        final weatherDataCubit = WeatherDataCubit(mockedWeatherDataRepository);
        expect(
          weatherDataCubit
              .fromJson(weatherDataCubit.toJson(weatherDataCubit.state)),
          weatherDataCubit.state,
        );
      });
    });

    group('fetchWeatherWithCity', () {
      blocTest<WeatherDataCubit, WeatherDataState>(
        'emits nothing when cityName is null',
        build: () => weatherDataCubit,
        act: (cubit) => cubit.fetchWeatherWithCity(null),
        expect: () => <WeatherDataState>[],
      );

      blocTest<WeatherDataCubit, WeatherDataState>(
        'emits nothing when cityName is empty',
        build: () => weatherDataCubit,
        act: (cubit) => cubit.fetchWeatherWithCity(''),
        expect: () => <WeatherDataState>[],
      );

      blocTest<WeatherDataCubit, WeatherDataState>(
        'calls updateWeatherWithCity with correct city',
        build: () => weatherDataCubit,
        act: (cubit) =>
            cubit.fetchWeatherWithCity(initialisedWeatherData.city.name),
        verify: (_) {
          verify(() => mockedWeatherDataRepository.updateWeatherWithCity(
              initialisedWeatherData.city.name)).called(1);
        },
      );

      blocTest<WeatherDataCubit, WeatherDataState>(
        'emits [loading, failure] when updateWeatherWithCity throws',
        setUp: () {
          when(
            () => mockedWeatherDataRepository.updateWeatherWithCity(any()),
          ).thenThrow(LocationException());
        },
        build: () => weatherDataCubit,
        act: (cubit) =>
            cubit.fetchWeatherWithCity(initialisedWeatherData.city.name),
        expect: () => <WeatherDataState>[
          const WeatherDataState(status: AppStatus.loading),
          const WeatherDataState(status: AppStatus.failure),
        ],
      );

      blocTest<WeatherDataCubit, WeatherDataState>(
        'emits [loading, offline] when updateWeatherWithCity throws',
        setUp: () {
          when(
            () => mockedWeatherDataRepository.updateWeatherWithCity(any()),
          ).thenThrow(const SocketException('Internet is offline'));
        },
        build: () => weatherDataCubit,
        act: (cubit) =>
            cubit.fetchWeatherWithCity(initialisedWeatherData.city.name),
        expect: () => <WeatherDataState>[
          const WeatherDataState(status: AppStatus.loading),
          const WeatherDataState(status: AppStatus.offline),
        ],
      );

      blocTest<WeatherDataCubit, WeatherDataState>(
        'emits [success, weatherData] when fetchWeatherWithCity returns',
        build: () => weatherDataCubit,
        act: (cubit) =>
            cubit.fetchWeatherWithCity(initialisedWeatherData.city.name),
        expect: () => <dynamic>[
          const WeatherDataState(status: AppStatus.loading),
          isA<WeatherDataState>()
              .having((w) => w.status, 'status', AppStatus.success)
              .having(
                  (w) => w.weatherData,
                  'mockedWeatherData',
                  isA<WeatherData>()
                      .having(
                          (w) => w.city, 'city', initialisedWeatherData.city)
                      .having((w) => w.cod, 'cod', initialisedWeatherData.cod)
                      .having((w) => w.message, 'message',
                          initialisedWeatherData.message)
                      .having((w) => w.cnt, 'cnt', initialisedWeatherData.cnt)
                      .having(
                          (w) => w.list, 'list', initialisedWeatherData.list))
        ],
      );
    });

    group('fetchWeatherWithCoordinates', () {
      blocTest<WeatherDataCubit, WeatherDataState>(
        'calls fetchWeatherWithCoordinates with correct coordinates',
        build: () => weatherDataCubit,
        act: (cubit) => cubit.fetchWeatherWithCoordinates(
            initialisedWeatherData.city.coord.lat,
            initialisedWeatherData.city.coord.lon),
        verify: (_) {
          verify(() => mockedWeatherDataRepository.updateWeatherWithCoordinates(
              initialisedWeatherData.city.coord.lat,
              initialisedWeatherData.city.coord.lon)).called(1);
        },
      );

      blocTest<WeatherDataCubit, WeatherDataState>(
        'emits [loading, failure] when updateWeatherWithCoordinates throws',
        setUp: () {
          when(
            () => mockedWeatherDataRepository.updateWeatherWithCoordinates(
                any(), any()),
          ).thenThrow(LocationException());
        },
        build: () => weatherDataCubit,
        act: (cubit) => cubit.fetchWeatherWithCoordinates(
            initialisedWeatherData.city.coord.lat,
            initialisedWeatherData.city.coord.lon),
        expect: () => <WeatherDataState>[
          const WeatherDataState(status: AppStatus.loading),
          const WeatherDataState(status: AppStatus.failure),
        ],
      );

      blocTest<WeatherDataCubit, WeatherDataState>(
        'emits [loading, offline] when updateWeatherWithCoordinates throws',
        setUp: () {
          when(
            () => mockedWeatherDataRepository.updateWeatherWithCoordinates(
                any(), any()),
          ).thenThrow(const SocketException('Internet is offline'));
        },
        build: () => weatherDataCubit,
        act: (cubit) => cubit.fetchWeatherWithCoordinates(
            initialisedWeatherData.city.coord.lat,
            initialisedWeatherData.city.coord.lon),
        expect: () => <WeatherDataState>[
          const WeatherDataState(status: AppStatus.loading),
          const WeatherDataState(status: AppStatus.offline),
        ],
      );

      blocTest<WeatherDataCubit, WeatherDataState>(
        'emits [success, weatherData] when fetchWeatherWithCoordinates returns',
        build: () => weatherDataCubit,
        act: (cubit) => cubit.fetchWeatherWithCoordinates(
            initialisedWeatherData.city.coord.lat,
            initialisedWeatherData.city.coord.lon),
        expect: () => <dynamic>[
          const WeatherDataState(status: AppStatus.loading),
          isA<WeatherDataState>()
              .having((w) => w.status, 'status', AppStatus.success)
              .having(
                  (w) => w.weatherData,
                  'mockedWeatherData',
                  isA<WeatherData>()
                      .having(
                          (w) => w.city, 'city', initialisedWeatherData.city)
                      .having((w) => w.cod, 'cod', initialisedWeatherData.cod)
                      .having((w) => w.message, 'message',
                          initialisedWeatherData.message)
                      .having((w) => w.cnt, 'cnt', initialisedWeatherData.cnt)
                      .having(
                          (w) => w.list, 'list', initialisedWeatherData.list))
        ],
      );
    });
  });
}
