import 'package:flutter/material.dart';
import 'package:joke_app/widgets/joke_card.dart';

import '../models/joke.dart';

class JokesList extends StatelessWidget {
  final List<Joke> jokes;

  const JokesList({super.key, required this.jokes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return JokeCard(joke: jokes[index]);
      },
    );
  }
}
