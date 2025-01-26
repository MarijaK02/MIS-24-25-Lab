class Quantity {
  final double amount;
  final String unit;

  Quantity({
    required this.amount,
    required this.unit,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) {
    return Quantity(
      amount: json['amount'].toDouble(),
      unit: json['unit'],
    );
  }
}

class Ingredient {
  final String name;
  final Quantity quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      quantity: Quantity.fromJson(json['quantity']),
    );
  }
}