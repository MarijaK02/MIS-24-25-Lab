import 'package:exam_app/providers/exam_provider.dart';
import 'package:exam_app/screens/exam_calendar.dart';
import 'package:exam_app/screens/map.dart';
import 'package:exam_app/service/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NotificationService.instance.initializeNotifications();

  runApp(
    ChangeNotifierProvider(
        create: (context) => ExamProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Exam Schedule',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ExamsCalendar(),
        '/map': (context) => const MapPage()
      },
    );
  }
}
