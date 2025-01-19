import 'package:flutter/cupertino.dart';

class ExamError extends StatelessWidget{
  final String message;
  const ExamError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(message)
    );
  }

}