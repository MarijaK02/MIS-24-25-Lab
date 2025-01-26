import 'package:food_delivery_app/models/restaurant.dart';

import '../data/restaurant_data.dart';

class RestaurantService{
  List<Restaurant> getRestaurants() {
    return rawRestaurantData.map((json) => Restaurant.fromJson(json)).toList();
  }
}