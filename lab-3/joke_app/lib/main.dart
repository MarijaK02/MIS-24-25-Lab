import 'package:flutter/material.dart';
import 'package:joke_app/screens/home.dart';
import 'package:joke_app/screens/jokes_list.dart';
import 'package:joke_app/screens/random_joke.dart';
import 'package:joke_app/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        appBarTheme: AppBarTheme(
          color: Colors.cyan[400],
          elevation: 10,
          shadowColor: Colors.black,
          foregroundColor: Colors.pink,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 30
          )
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/jokes': (context){
          final jokeType = ModalRoute.of(context)!.settings.arguments as String;
          return JokesList(jokeType: jokeType);
        },
        '/random-joke': (context) => const RandomJoke()
      },
    );
  }
}

