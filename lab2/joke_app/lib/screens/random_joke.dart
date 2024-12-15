import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/models/joke.dart';
import 'package:joke_app/services/api_service.dart';
import 'package:joke_app/widgets/joke_card.dart';

import '../widgets/navbar.dart';

class RandomJoke extends StatefulWidget{
  const RandomJoke({super.key});

  @override
  State<RandomJoke> createState() => _RandomJokeState();
}

class _RandomJokeState extends State<RandomJoke> {
  Joke joke = Joke(id: 0, type: '', setup: '', punchline: '');
  @override
  void initState(){
    super.initState();
    ApiService.fetchRandomDailyJoke().then((data) {
      setState(() {
        joke=data;
      });

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: "Random joke"),
        body: JokeCard(joke: joke)
      );
  }
}