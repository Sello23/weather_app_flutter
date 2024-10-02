import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter/shared/helper/location_handler.dart';
import 'package:weather_app_flutter/shared/states/location_permission_status.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Position? _currentPosition;

  @override
  void initState() {
    _getCurrentPosition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Permission page")),
    );
  }

  Future<void> _getCurrentPosition() async {
    try {
      final locationPermissionStatus =
          await LocationHandler.handleLocationPermission();
      switch (locationPermissionStatus) {
        //TODO: Pay attention to "break"
        case LocationPermissionStatus.denied:
          showSnackBar("Location permissions are denied");
        case LocationPermissionStatus.disabled:
          showSnackBar(
              "Location services are disabled. Please enable the services");
        case LocationPermissionStatus.deniedForever:
          showSnackBar(
              "Location permissions are permanently denied, we cannot request permissions");
        case LocationPermissionStatus.error:
        case LocationPermissionStatus.found:
          getPosition();
      }
    } catch (_) {
      showSnackBar("An error while loading permissions. Please retry");
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text(message)));
  }

  Future<void> getPosition() async {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    await Geolocator.getCurrentPosition(locationSettings: locationSettings)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
