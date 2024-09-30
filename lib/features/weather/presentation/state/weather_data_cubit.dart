import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_app_flutter/features/weather/presentation/state/weather_data_state.dart';
import 'package:weather_app_flutter/shared/app_state.dart';
import 'package:weather_app_flutter/shared/location_exception.dart';

import '../../domain/repositories/weather_data_repository.dart';

class WeatherDataCubit extends HydratedCubit<WeatherDataState> {
  WeatherDataCubit(this._weatherDataRepository) : super(const WeatherDataState());
  final WeatherDataRepository _weatherDataRepository;

  Future<void> fetchWeatherWithCity(String cityName) async {
    emit(state.copyWith(status: AppStatus.loading));

    try {
      final weatherData =
          await _weatherDataRepository.updateWeatherWithCity(cityName);
      emit(state.copyWith(
        status: AppStatus.success,
        weatherData: weatherData,
      ));
    } on LocationException {
      emit(state.copyWith(status: AppStatus.failure));
    } catch (_) {
      emit(state.copyWith(status: AppStatus.offline));
    }
  }

  Future<void> fetchWeatherWithCoordinates(
      double latitude, double longitude) async {
    emit(state.copyWith(status: AppStatus.loading));

    try {
      final weatherData = await _weatherDataRepository.updateWeatherWithCoordinates(
          latitude, longitude);
      emit(state.copyWith(
        status: AppStatus.success,
        weatherData: weatherData,
      ));
    } on LocationException {
      emit(state.copyWith(status: AppStatus.failure));
    } catch (_) {
      emit(state.copyWith(status: AppStatus.offline));
    }
  }

  @override
  WeatherDataState fromJson(Map<String, dynamic> json) =>
      WeatherDataState.fromJson(json);

  @override
  Map<String, dynamic> toJson(WeatherDataState state) => state.toJson();
}
