
import 'location.dart';

class Exam {
  final int id;
  final String subject;
  final DateTime dateTime;
  final Location location;

  Exam({
    required this.id,
    required this.subject,
    required this.dateTime,
    required this.location,
  });

  factory Exam.fromJson(Map<String, dynamic> data){
    return Exam(
      id: int.parse(data['id']),
      subject: data['subject'],
      dateTime: DateTime.parse(data['dateTime']),
      location: Location.fromJson(data['location'])
    );
  }

}