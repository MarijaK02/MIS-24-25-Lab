class Address{
  final String street;
  final String number;
  final String city;
  final String municipality;
  final String longitude;
  final String latitude;

  Address({
    required this.street,
    required this.number,
    required this.city,
    required this.municipality,
    required this.longitude,
    required this.latitude
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      number: json['number'],
      city: json['city'],
      municipality: json['municipality'],
      longitude: json['longitude'],
      latitude: json['latitude']
    );
  }
}