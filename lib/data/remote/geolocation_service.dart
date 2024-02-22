import 'package:geolocator/geolocator.dart';

class GeolocationService {
  Future<Position> determinePosition() async {
    if (!await _isLocationServiceEnabled()) {
      throw LocationServiceDisabledException();
    }

    final permission = await _getOrRequestPermission();
    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionPermanentlyDeniedException();
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<bool> _isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<LocationPermission> _getOrRequestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }
}

class LocationServiceDisabledException implements Exception {
  @override
  String toString() => 'Location services are disabled.';
}

class LocationPermissionPermanentlyDeniedException implements Exception {
  @override
  String toString() =>
      'Location permissions are permanently denied, we cannot request permissions.';
}
