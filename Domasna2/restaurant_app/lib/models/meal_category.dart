enum MealCategory {
  appetizers,
  mainCourse,
  desserts,
  alcoholicBeverages,
  nonAlcoholicBeverages,
  snacks,
}

const List<MealCategory> mealCategories = [
  MealCategory.appetizers,
  MealCategory.mainCourse,
  MealCategory.desserts,
  MealCategory.alcoholicBeverages,
  MealCategory.nonAlcoholicBeverages,
  MealCategory.snacks,
];

extension MealCategoryExtension on MealCategory {
  String get name {
    switch (this) {
      case MealCategory.appetizers:
        return 'Appetizers';
      case MealCategory.mainCourse:
        return 'Main Course';
      case MealCategory.desserts:
        return 'Desserts';
      case MealCategory.alcoholicBeverages:
        return 'Alcoholic Beverages';
      case MealCategory.nonAlcoholicBeverages:
        return 'Non-Alcoholic Beverages';
      case MealCategory.snacks:
        return 'Snacks';
    }
  }

  String get description {
    switch (this) {
      case MealCategory.appetizers:
        return 'Light dishes to start your meal.';
      case MealCategory.mainCourse:
        return 'Hearty and filling dishes to be the main part of your meal.';
      case MealCategory.desserts:
        return 'Sweet treats to end your meal.';
      case MealCategory.alcoholicBeverages:
        return 'Drinks containing alcohol, perfect for special occasions.';
      case MealCategory.nonAlcoholicBeverages:
        return 'Refreshing drinks without alcohol.';
      case MealCategory.snacks:
        return 'Quick and easy dishes for in-between meals.';
    }
  }
}
