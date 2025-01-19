import 'package:flutter/material.dart';

import '../models/exam.dart';

class ExamDetailsCard extends StatelessWidget{
  final Exam exam;
  const ExamDetailsCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: 15, vertical: 5),
      child: ListTile(
        title: Text(exam.subject), // Example field
        subtitle: Text(
          '${exam.dateTime.toLocal().hour.toString().padLeft(2, '0')}'
              ':${exam.dateTime.toLocal().minute.toString().padLeft(2, '0')} '
              '- ${exam.location}', // Example
        ),
      ),
    );
  }

}