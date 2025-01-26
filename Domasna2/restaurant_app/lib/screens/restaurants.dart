import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/restaurant_card.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';
import '../providers/restaurant_provider.dart';

class RestaurantsScreen extends StatelessWidget{
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Restaurant> restaurants = context.watch<RestaurantProvider>().restaurants;

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