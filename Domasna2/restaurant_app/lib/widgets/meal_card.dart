import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealCard extends StatefulWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      child: SingleChildScrollView(  // Wrap the entire card with SingleChildScrollView
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  widget.meal.imageUrl,
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                widget.meal.name,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '\$${widget.meal.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[700],
                ),
              ),
              trailing: Icon(
                _isExpanded ? Icons.expand_less : Icons.expand_more,
                size: 18.0,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
            if (_isExpanded) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      widget.meal.description,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Ingredients: ${widget.meal.ingredients.map((ingredient) => "${ingredient.name} (${ingredient.quantity.amount} ${ingredient.quantity.unit})").join(", ")}',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
