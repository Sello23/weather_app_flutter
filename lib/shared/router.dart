import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_flutter/features/weather/domain/repositories/weather_data_repository.dart';
import 'package:weather_app_flutter/features/weather/presentation/screens/location_screen.dart';
import 'package:weather_app_flutter/features/weather/presentation/screens/weather_screen.dart';
import 'package:weather_app_flutter/features/weather/presentation/state/weather_data_cubit.dart';

import '../features/weather/data/models/coord.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return MaterialPage<void>(
            key: state.pageKey, child: const LocationScreen());
      },
    ),
    GoRoute(
      path: '/location',
      pageBuilder: (context, state) {
        final coordinatesJson = state.uri.queryParameters['coord']!;
        final coordinates = Coord.fromJson(jsonDecode(coordinatesJson));

        return MaterialPage<void>(
          key: state.pageKey,
          child: BlocProvider(
              create: (context) => WeatherDataCubit(WeatherDataRepository())
                ..fetchWeatherWithCoordinates(coordinates.lat, coordinates.lon),
              child: const WeatherScreen()),
        );
      },
    ),
  ],
);
