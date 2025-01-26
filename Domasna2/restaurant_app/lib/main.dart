import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/restaurant_provider.dart';
import 'package:food_delivery_app/screens/home.dart';
import 'package:food_delivery_app/screens/restaurant_details.dart';
import 'package:food_delivery_app/screens/restaurant_menu.dart';
import 'package:food_delivery_app/screens/restaurants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantProvider>(
          create: (_) => RestaurantProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      routes: {
        '/restaurants': (context) => RestaurantsScreen(),
        '/details': (context) => RestaurantDetailsScreen(),
        '/menu': (context) => RestaurantMenu()
      },
    );
  }
}
