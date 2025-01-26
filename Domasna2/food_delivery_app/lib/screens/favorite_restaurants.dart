import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/empty_page_message.dart';
import 'package:food_delivery_app/widgets/restaurant_card.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';
import '../providers/restaurant_provider.dart';

class FavoriteRestaurantsScreen extends StatelessWidget{
  const FavoriteRestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Restaurant> restaurants = context.watch<RestaurantProvider>().restaurants.where((r) => r.isFavorite).toList();

    if (restaurants.isEmpty) {
      return Center(
          child: EmptyPageMessage(message: "There aren't any restaurants marked as favorite")
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: ListView(
        children: restaurants.map((r){
          return RestaurantCard(restaurant: r);
        }).toList(),
      ),
    );
  }

}