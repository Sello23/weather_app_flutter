import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/features/weather/presentation/screens/weather_screen_layout.dart';
import 'package:weather_app_flutter/features/weather/presentation/state/weather_data_cubit.dart';
import 'package:weather_app_flutter/features/weather/presentation/state/weather_data_state.dart';

import '../../../../shared/states/app_status.dart';
import '../widgets/exception_tile.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherDataCubit, WeatherDataState>(
      builder: (BuildContext context, WeatherDataState state) {
        return switch (state.status) {
          AppStatus.loading => const Center(
              child: CircularProgressIndicator(),
            ),
          AppStatus.success =>
            WeatherScreenLayout(weatherData: state.weatherData),
          AppStatus.failure => const ExceptionTile(
              message: "Something went wrong",
              iconShown: Icons.error,
            ),
          AppStatus.offline => const ExceptionTile(
              message: "Device offline",
              iconShown: Icons.wifi_off,
            ),
        };
      },
    );
  }
}
