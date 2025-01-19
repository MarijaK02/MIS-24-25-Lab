import 'package:exam_app/service/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../models/exam.dart';
import '../providers/exam_provider.dart';
import 'dart:async';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng _currentLocation = const LatLng(41.9981, 21.4254); // Default location
  late List<Exam> _exams;
  Set<Marker> _markers = {};  // Set to hold markers
  late GoogleMapController mapController;  // Controller for Google Map
  Set<Polyline> _polylines = {};  // Set to hold polyline

  final String apiKey = 'AIzaSyBdP7wgsOu6OPaXUQDV5GS3W75d6-lIFnw'; // Replace with your API key

  MarkerId? _selectedMarkerId;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    try {
      LatLng location = await LocationService.instance.useCurrentLocation();
      setState(() {
        _currentLocation = location;
        print("Current Location: $location");

        _markers = {
          Marker(
            markerId: const MarkerId("_currentLocation"),
            icon: BitmapDescriptor.defaultMarkerWithHue(0.2),
            position: _currentLocation,
          ),
        };

        for (var exam in _exams) {
          if (exam.location != null) {
            _markers.add(
              Marker(
                markerId: MarkerId(exam.id.toString()),
                position: LatLng(exam.location.latitude, exam.location.longitude),
                infoWindow: InfoWindow(
                  title: exam.location.name,
                  snippet: '${exam.location.latitude}, ${exam.location.longitude}',
                ),
                icon: BitmapDescriptor.defaultMarker,
                onTap: () async {
                  await _onMarkerTapped(exam);
                },
              ),
            );
          }
        }
      });

      if (_currentLocation != null) {
        mapController.animateCamera(
          CameraUpdate.newLatLngZoom(_currentLocation, 13),
        );
      } else {
        print("Location is null");
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> _onMarkerTapped(Exam exam) async {
    setState(() {
      _selectedMarkerId = MarkerId(exam.id.toString());
      _polylines.clear();
      _markers.removeWhere((marker) => marker.markerId.value.startsWith("destination"));
    });

    await _showRouteToExam(exam);
  }

  Future<void> _showRouteToExam(Exam exam) async {
    try {
      List<LatLng> polylineCoordinates = await LocationService.instance.getRoute(
        _currentLocation,
        LatLng(exam.location.latitude, exam.location.longitude),
        apiKey,
      );

      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId("destination_${exam.id}"),
            position: LatLng(exam.location.latitude, exam.location.longitude),
            infoWindow: InfoWindow(
              title: 'Exam Location: ${exam.location.latitude} ${exam.location.longitude}',
            ),
            icon: BitmapDescriptor.defaultMarker
          ),
        );

        _polylines.add(
          Polyline(
            polylineId: PolylineId("route"),
            points: polylineCoordinates,
            color: Colors.blue,
            width: 5,
          ),
        );
      });
    } catch (e) {
      print("Error showing route: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    _exams = context.watch<ExamProvider>().exams;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          print("MapController initialized");
        },
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: 13,
        ),
        markers: _markers,
        polylines: _polylines,
      ),
    );
  }
}
