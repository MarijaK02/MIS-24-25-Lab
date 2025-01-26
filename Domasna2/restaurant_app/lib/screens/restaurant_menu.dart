import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';
import '../providers/restaurant_provider.dart';
import '../widgets/meal_category_selector.dart';
import '../widgets/menu_list.dart';

class RestaurantMenu extends StatefulWidget{
  const RestaurantMenu({super.key});

  @override
  State<RestaurantMenu> createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantProvider>().resetSelectedCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Restaurant restaurant = ModalRoute.of(context)?.settings.arguments as Restaurant;

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w300
        ),
        shadowColor: Colors.black87,
        elevation: 20.0,
      ),
      body: Column(
        children: [
          MealCategorySelector(),
          MenuList(menu: restaurant.menu.where((meal) => meal.category == context.watch<RestaurantProvider>().selectedMealCategory).toList())
        ],
      )
    );
  }
}