import 'package:food_delivery_app/models/meal_category.dart';

import 'ingredient.dart';

class Meal {
  final String id;
  final String name;
  final List<Ingredient> ingredients;
  final double price;
  final String imageUrl;
  final String description;
  final MealCategory category;

  Meal({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.category
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      name: json['name'],
      ingredients: (json['ingredients'] as List).map((ingredientJson) => Ingredient.fromJson(ingredientJson)).toList(),
      price: json['price'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      category: json['category']
    );
  }
}