import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_flutter/features/weather/data/models/weather_data.dart';
import 'package:weather_app_flutter/features/weather/domain/repositories/weather_data_repository.dart'
    as weather_data_repository;
import 'package:weather_app_flutter/features/weather/presentation/state/weather_data_cubit.dart';
import 'package:weather_app_flutter/features/weather/presentation/state/weather_data_state.dart';

const weatherLocation = 'London';

class MockWeatherRepository extends Mock
    implements weather_data_repository.WeatherDataRepository {}

class MockWeatherData extends Mock implements WeatherData {}

class MockStorage extends Mock implements Storage {}

late Storage hydratedStorage;
late WeatherData weatherData;
late weather_data_repository.WeatherDataRepository weatherDataRepository;
late WeatherDataCubit weatherDataCubit;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  initHydratedStorage();

  group('WeatherDataCubit', () {
    setUp(() async {
      weatherData = MockWeatherData();
      weatherDataRepository = MockWeatherRepository();
      when(
        () => weatherDataRepository.updateWeatherWithCity(any()),
      ).thenAnswer((_) async => weatherData);
      weatherDataCubit = WeatherDataCubit(weatherDataRepository);
    });

    test('initial state is correct', () {
      final weatherCubit = WeatherDataCubit(weatherDataRepository);
      expect(weatherCubit.state, WeatherDataState());
    });
  });
}

void initHydratedStorage() {
  hydratedStorage = MockStorage();
  when(
    () => hydratedStorage.write(any(), any<dynamic>()),
  ).thenAnswer((_) async {});
  HydratedBloc.storage = hydratedStorage;
}
