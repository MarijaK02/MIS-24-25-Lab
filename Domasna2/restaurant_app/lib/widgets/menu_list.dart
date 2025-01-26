import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/empty_page_message.dart';
import 'package:food_delivery_app/widgets/meal_card.dart';
import '../models/meal.dart';

class MenuList extends StatelessWidget {
  final List<Meal> menu;

  const MenuList({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    if (menu.isEmpty) {
      return EmptyPageMessage(message: "No meals from the chosen category.");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: menu.length,
          itemBuilder: (context, index) {
            final meal = menu[index];
            return MealCard(meal: meal);
          },
        ),
      ],
    );
  }
}
