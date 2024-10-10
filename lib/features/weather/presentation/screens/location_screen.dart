import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_flutter/features/weather/data/models/coord.dart';
import 'package:weather_app_flutter/shared/helper/location_handler.dart';
import 'package:weather_app_flutter/shared/states/location_permission_status.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    _getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  Future<void> _getCurrentPosition() async {
    try {
      const CircularProgressIndicator();

      final locationPermissionStatus =
          await LocationHandler.handleLocationPermission();

      if (mounted) {
        switch (locationPermissionStatus) {
          case LocationPermissionStatus.denied:
            _dialogBuilder(context, "Location permissions are denied");
          case LocationPermissionStatus.disabled:
            _dialogBuilder(context,
                "Location services are disabled. Please enable the services");
          case LocationPermissionStatus.deniedForever:
            _dialogBuilder(context,
                "Location services are disabled. Please enable the services");
          case LocationPermissionStatus.error:
            showSnackBar("An error has occurred");
          case LocationPermissionStatus.found:
            {
              getPosition().then((position) {
                final coordinates =
                    Coord(lon: position.longitude, lat: position.latitude);
                final coordinatesJson = jsonEncode(coordinates.toJson());
                if (mounted) GoRouter.of(context).go('/location/?coord=$coordinatesJson');
              });
            }
        }
      }
    } catch (_) {
      showSnackBar("An error while loading permissions. Please retry");
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _dialogBuilder(BuildContext context, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permissions'),
          content: Text(
            message,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                return;
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Retry'),
              onPressed: () {
                _getCurrentPosition();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Position> getPosition() async {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    return await Geolocator.getCurrentPosition(
        locationSettings: locationSettings);
  }
}
