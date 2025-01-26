import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/providers/restaurant_provider.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4.0,
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: restaurant.id);
            },
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
                child: Image.network(
                  restaurant.imageUrl,
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            restaurant.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          RatingBarIndicator(
                            rating: (restaurant.reviews?.map((review) => review.rating).fold(0.0, (a, b) => a + b) ?? 0.0) /
                                (restaurant.reviews?.length ?? 1),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      )
                  )
              ),
              IconButton(
                  onPressed: (){
                    context.read<RestaurantProvider>().toggleFavoriteRestaurant(restaurant);
                  },
                  icon: Icon(
                      Icons.favorite,
                    color: restaurant.isFavorite ? Colors.red : Theme.of(context).primaryColor,
                  )
              )
            ])
        )
    );
  }
}
