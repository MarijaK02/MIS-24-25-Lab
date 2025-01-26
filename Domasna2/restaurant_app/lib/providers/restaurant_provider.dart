import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/models/meal_category.dart';

import '../models/restaurant.dart';
import '../models/review.dart';
import '../service/restaurant_service.dart';

class RestaurantProvider extends ChangeNotifier{
  final _restaurantService = RestaurantService();
  List<Restaurant> restaurants = [];
  MealCategory? selectedMealCategory;

  RestaurantProvider(){
    restaurants = _restaurantService.getRestaurants();
    selectedMealCategory = null;
  }

  void toggleMealCategory(int index){
    selectedMealCategory = mealCategories[index];
    notifyListeners();
  }

  void resetSelectedCategory() {
    selectedMealCategory = mealCategories[0];
    notifyListeners();
  }

  void toggleFavoriteRestaurant(Restaurant restaurant){
    restaurant.isFavorite = !restaurant.isFavorite;
    notifyListeners();
  }

  void addReview(Restaurant restaurant, Review review){
    restaurant.reviews ??= [];
    restaurant.reviews?.add(review);
    notifyListeners();
  }
}