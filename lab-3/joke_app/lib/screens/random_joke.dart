import 'package:flutter/material.dart';
import 'package:joke_app/services/api_service.dart';
import 'package:provider/provider.dart';
import 'package:joke_app/widgets/joke_card.dart';
import '../models/joke.dart';
import '../providers/joke_provider.dart';
import '../widgets/navbar.dart';

class RandomJoke extends StatefulWidget {
  const RandomJoke({super.key});

  @override
  State<RandomJoke> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJoke> {
  late Future<Joke> randomJoke;

  @override
  void initState(){
    super.initState();
    randomJoke = ApiService.fetchRandomDailyJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(title: "Random Joke"),
      body: FutureBuilder<Joke>(
        future: randomJoke,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("No random joke"));
          } else if (snapshot.hasData) {
            return JokeCard(
              joke: snapshot.data!, // Display the first (and only) random joke
              isRandomJoke: true,
            );
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
