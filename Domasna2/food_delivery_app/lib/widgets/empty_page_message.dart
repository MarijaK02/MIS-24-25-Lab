import 'package:flutter/material.dart';

class EmptyPageMessage extends StatelessWidget{
  final String message;
  const EmptyPageMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[700],
        ),
      ),
    );
  }

}