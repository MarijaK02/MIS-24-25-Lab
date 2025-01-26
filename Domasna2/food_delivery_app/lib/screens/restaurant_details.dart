import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/restaurant_provider.dart';
import 'package:food_delivery_app/widgets/create_review.dart';
import 'package:food_delivery_app/widgets/restaurant_review_list.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String restaurantId = ModalRoute.of(context)?.settings.arguments as String;
    final Restaurant restaurant = context.watch<RestaurantProvider>().restaurants.firstWhere((r) => r.id == restaurantId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          restaurant.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        shadowColor: Colors.black54,
        elevation: 15,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 15, left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(restaurant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      restaurant.description,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${restaurant.address.street} ${restaurant.address.number}, ${restaurant.address.municipality}, ${restaurant.address.city}',
                            textAlign: TextAlign.start,
                              style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.visible
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/menu', arguments: restaurant);}, child: Text("See menu")),
                    CreateReviewWidget(onSubmitReview: (review){
                      context.read<RestaurantProvider>().addReview(restaurant, review);
                    }),
                    RestaurantReviewList(reviews: restaurant.reviews ?? [])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
