import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Import the RatingBar package
import '../models/review.dart';
import 'empty_page_message.dart';

class RestaurantReviewList extends StatelessWidget {
  final List<Review> reviews;

  const RestaurantReviewList({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return Center(
        child: EmptyPageMessage(message: "There aren't reviews for this restaurant."),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Row(
                  children: [
                    Text(
                      '${review.rating}', // Show the numeric rating beside the stars
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 8),
                    RatingBarIndicator(
                      rating: review.rating.toDouble(),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                  Text(
                      review.comment.createdOn.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300
                    ),
                  )
                  ],
              ),
              subtitle: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: Text(
                    review.comment.body,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              )
            ),
          ),
        );
      },
    );
  }
}
