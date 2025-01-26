import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Import the RatingBar package
import '../models/review.dart';
import '../models/comment.dart';

class CreateReviewWidget extends StatefulWidget {
  final Function(Review) onSubmitReview;

  const CreateReviewWidget({super.key, required this.onSubmitReview});

  @override
  State<CreateReviewWidget> createState() => _CreateReviewWidgetState();
}

class _CreateReviewWidgetState extends State<CreateReviewWidget> {
  final TextEditingController _commentController = TextEditingController();
  double _rating = 0;

  // Function to submit the review
  void _submitReview() {
    if (_commentController.text.isNotEmpty && _rating > 0) {
      final comment = Comment(
        body: _commentController.text,
        createdOn: DateTime.now(),
      );

      final review = Review(
        comment: comment,
        rating: _rating
      );

      widget.onSubmitReview(review);
      // Clear the input fields after submission
      _commentController.clear();
      setState(() {
        _rating = 0;
      });
    } else {
      // Show an error if the comment or rating is not filled
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please provide a comment and a rating.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Theme.of(context).secondaryHeaderColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Leave a Review',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Your comment',
                  errorText: "Please provide a comment",
                  border: UnderlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              // Using RatingBar.builder to get rating
              RatingBar.builder(
                minRating: 1,
                initialRating: _rating,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitReview,
                child: Text('Submit Review'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
