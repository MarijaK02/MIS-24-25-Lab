import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/restaurant_provider.dart';
import 'package:provider/provider.dart';
import '../models/meal_category.dart';

class MealCategorySelector extends StatefulWidget {
  const MealCategorySelector({super.key});

  @override
  State<MealCategorySelector> createState() => _MealCategorySelectorState();
}

class _MealCategorySelectorState extends State<MealCategorySelector> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: mealCategories.map((category) {
          int categoryIndex = mealCategories.indexOf(category);
          return Container(
            width: 120,
            padding: EdgeInsets.symmetric(vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              selected: selectedIndex == categoryIndex,
              selectedTileColor: Theme.of(context).primaryColor,
              onTap: (){
                setState(() {
                  selectedIndex = categoryIndex;
                  context.read<RestaurantProvider>().toggleMealCategory(categoryIndex);
                });
              },

              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              tileColor: Theme.of(context).primaryColor.withAlpha(155),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(
                category.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                category.description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
