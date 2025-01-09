import 'package:flutter/material.dart';
import 'package:joke_app/main.dart';
import 'package:joke_app/providers/joke_provider.dart';
import 'package:provider/provider.dart';

import '../models/joke.dart';
import '../widgets/joke_card.dart';
import '../widgets/navbar.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(title: "Jokes"),
      body: ListView.builder(
        itemCount: context.watch<JokeProvider>().jokes.where((j) => j.isFavorite).length,
        itemBuilder: (context, index) {
          List<Joke> jokes = context.watch<JokeProvider>().jokes.where((j) => j.isFavorite).toList();
          return JokeCard(
              joke: jokes[index]
          );
        },
      )
    );
  }
}
