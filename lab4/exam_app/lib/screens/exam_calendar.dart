import 'package:exam_app/widgets/error.dart';
import 'package:exam_app/widgets/exam_calendar_table.dart';
import 'package:exam_app/widgets/exam_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/exam.dart';
import '../providers/exam_provider.dart';

class ExamsCalendar extends StatefulWidget {

  const ExamsCalendar({super.key});

  @override
  State<ExamsCalendar> createState() => _ExamsCalendarState();
}

class _ExamsCalendarState extends State<ExamsCalendar> {
  DateTime? _selectedDay;
  late List<Exam> _exams;
  late Map<DateTime, List<Exam>> _examsMap;


  Map<DateTime, List<Exam>> _getExamsMap(List<Exam> exams) {
    Map<DateTime, List<Exam>> examsMap = {};
    for (var exam in exams) {
      final examDate =
      DateTime(exam.dateTime.year, exam.dateTime.month, exam.dateTime.day); // Use only date
      if (examsMap[examDate] == null) {
        examsMap[examDate] = [];
      }
      examsMap[examDate]!.add(exam);
    }
    return examsMap;
  }

  @override
  Widget build(BuildContext context) {
    super.didChangeDependencies();
    _exams = context.watch<ExamProvider>().exams;

    _examsMap = _getExamsMap(_exams);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Exam Schedule'),
        actions: [
          ElevatedButton(
              onPressed: (){
            Navigator.pushNamed(context, '/map');
          },
            style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // Background color
      foregroundColor: Colors.white, // Text color
    ),
              child: const Text("Map"),
          )
        ],
      ),
      body: Column(
        children: [
          ExamCalendarTable(
            examsMap: _examsMap,
          onDaySelected: (selectedDay){
            setState(() {
              _selectedDay = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
            });
            }),
          const SizedBox(height: 10),
          // Display exams for the selected day
          Expanded(
            child: _selectedDay != null && _examsMap[_selectedDay!] != null
                ? ListView.builder(
              itemCount: _examsMap[_selectedDay!]!.length,
              itemBuilder: (context, index) {
                final exam = _examsMap[_selectedDay!]![index];
                return ExamDetailsCard(exam: exam);
              },
            )
                : const ExamError(message: "No exams for selected day")
            ),
            ]
        ),
      );
  }
}
