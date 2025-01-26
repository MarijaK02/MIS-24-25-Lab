import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/favorite_restaurants.dart';
import 'package:food_delivery_app/screens/restaurants.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPageIndex == 0 ? "Restaurants" : "My favorites" ),
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
      body: [RestaurantsScreen(), FavoriteRestaurantsScreen()][_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites')
      ]),
    );
  }
}