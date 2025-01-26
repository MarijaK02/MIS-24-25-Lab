import 'package:food_delivery_app/models/comment.dart';

class Review {
  final Comment comment;
  final double rating;

  Review({
    required this.comment,
    required this.rating
  });
}