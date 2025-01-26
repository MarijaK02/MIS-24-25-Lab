import 'package:food_delivery_app/models/review.dart';

import 'address.dart';
import 'meal.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final Address address;
  final String imageUrl;
  final List<Meal> menu;
  bool isFavorite;
  List<Review>? reviews;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.imageUrl,
    required this.menu,
    this.isFavorite = false,
    this.reviews
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
        id: json['id'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        description: json['description'],
        address: Address.fromJson(json['address']),
        menu: (json['menu'] as List).map((mealJson) => Meal.fromJson(mealJson)).toList()
    );
  }

}