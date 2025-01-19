import 'package:exam_app/service/location_service.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import '../models/exam.dart';
import '../service/exam_service.dart';

class ExamProvider extends ChangeNotifier {
  final _examService = ExamService();
  late final List<Exam> exams;

  ExamProvider() {
    exams = _examService.getExams();
    // Add a delay to ensure location is available
    Future.delayed(const Duration(seconds: 1), () {
      for (var e in exams) {
        print('Starting proximity checks for exam: ${e.subject}');
        LocationService.instance.startProximityChecks(e.location.latitude, e.location.longitude);
      }
    });
  }
}
