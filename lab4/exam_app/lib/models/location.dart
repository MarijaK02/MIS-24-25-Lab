class Location {
  final String name;
  final double longitude;
  final double latitude;

  Location({required this.name, required this.longitude, required this.latitude});

  factory Location.fromJson(Map<String, dynamic> data){
    return Location(name: data['name'], longitude: double.tryParse(data['longitude'].toString()) ?? 0.0,
      latitude: double.tryParse(data['latitude'].toString()) ?? 0.0);
  }
}