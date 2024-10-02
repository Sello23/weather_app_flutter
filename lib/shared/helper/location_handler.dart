import 'package:geolocator/geolocator.dart';

import '../states/location_permission_status.dart';

abstract class LocationHandler {
  static Future<LocationPermissionStatus> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are disabled. Please enable the services
      return LocationPermissionStatus.disabled;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Location permissions are denied
        return LocationPermissionStatus.denied;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Location permissions are permanently denied, we cannot request permissions.
      return LocationPermissionStatus.deniedForever;
    }
    return LocationPermissionStatus.found;
  }
}
