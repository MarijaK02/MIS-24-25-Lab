import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/exam.dart';

class ExamCalendarTable extends StatefulWidget{
  final Map<DateTime, List<Exam>> examsMap;
  final Function(DateTime selectedDay) onDaySelected;

  const ExamCalendarTable({super.key, required this.examsMap, required this.onDaySelected});

  @override
  State<ExamCalendarTable> createState() => _ExamCalendarTableState();
}

class _ExamCalendarTableState extends State<ExamCalendarTable> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: DateTime.now().toLocal(),
      calendarStyle: CalendarStyle(
        todayDecoration: const BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.green.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        outsideDecoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        // Default decoration
        defaultDecoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        weekendDecoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
      ),
      selectedDayPredicate: (day){
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay){
        widget.onDaySelected(selectedDay);
        setState(() {
          _selectedDay = selectedDay;
        });
      },
      eventLoader: (day) {
        final localDay = DateTime(day.year, day.month, day.day);
        return widget.examsMap[localDay] ?? []; // Return the exams for that date
      },
      calendarBuilders: CalendarBuilders(
        // Customizing the background for the days with exams
        defaultBuilder: (context, date, events) {
          final localDate = DateTime(date.year, date.month, date.day);
          if (widget.examsMap.containsKey(localDate)) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.5), // Background color for exam days
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  date.day.toString(),
                ),
              ),
            );
          }
          return null; // Return null if no exams for that day
        },
      ),
    );
  }
}