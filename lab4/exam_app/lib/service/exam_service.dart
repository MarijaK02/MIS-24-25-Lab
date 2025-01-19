import 'package:exam_app/models/exam.dart';

import '../data/exams.dart';

class ExamService{
  List<Exam> getExams(){
    return examsRawData.map((e) => Exam.fromJson(e)).toList();
  }
}