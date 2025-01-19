import 'dart:async';
import 'dart:convert';

import 'package:exam_app/service/notification_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LocationService{
  LocationService._privateConstructor();

  static final LocationService instance = LocationService._privateConstructor();

  Future<void> startProximityChecks(double targetLatitude, double targetLongitude) async {
    Timer.periodic(const Duration(seconds: 30), (_) async {
      await checkProximity(targetLatitude, targetLongitude);
    });
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Локациските сервиси не се овозможени.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Локациските дозволи се одбиени.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Локациските дозволи се трајно одбиени. Не може да се добие локацијата.');
    }

    return await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(
          forceLocationManager: true,
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
    ));
  }

  Future<LatLng> useCurrentLocation() async {
      // Get the current location
      Position position = await getCurrentLocation();

      // Extract latitude and longitude
      double latitude = position.latitude;
      double longitude = position.longitude;

      print("Current Location: Latitude = $latitude, Longitude = $longitude");

      // Example: Store or use the location in your app
      return LatLng(latitude, longitude);

  }

  Future<void> checkProximity(
      double targetLatitude, double targetLongitude) async {
    Position position = await getCurrentLocation();

    double distanceInMeters = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      targetLatitude,
      targetLongitude,
    );

    if (distanceInMeters < 500) {
      await NotificationService.instance.showNotification(
        'Потсетник за испит!',
        'Во близина сте на локацијата за вашиот испит.',
      );
    }

    if (distanceInMeters < 50) {
      await NotificationService.instance.showNotification(
        'Потсетник за испит!',
        'Стигнавте на локацијата за вашиот испит.',
      );
    }
  }


  Future<List<LatLng>> getRoute(LatLng origin, LatLng destination, String apiKey) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$apiKey');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<LatLng> polylineCoordinates = [];

      if (data['routes'] != null && data['routes'].isNotEmpty) {
        final route = data['routes'][0]['overview_polyline']['points'];
        polylineCoordinates = _decodePolyline(route);
      }
      return polylineCoordinates;
    } else {
      throw Exception('Failed to fetch route');
    }
  }

  List<LatLng> _decodePolyline(String polyline) {
    List<LatLng> polylineCoordinates = [];
    int index = 0;
    int len = polyline.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int shift = 0;
      int result = 0;
      while (true) {
        int byte = polyline.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
        if (byte < 0x20) break;
      }
      int deltaLat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += deltaLat;

      shift = 0;
      result = 0;
      while (true) {
        int byte = polyline.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
        if (byte < 0x20) break;
      }
      int deltaLng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += deltaLng;

      polylineCoordinates.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return polylineCoordinates;
  }
}