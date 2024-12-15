import 'package:flutter/material.dart';
import 'package:joke_app/services/api_service.dart';
import 'package:joke_app/widgets/jokes_list_view.dart';

import '../models/joke.dart';
import '../widgets/navbar.dart';

class JokesList extends StatefulWidget{
  final String jokeType;
  const JokesList({super.key, required this.jokeType});

  @override
  State<JokesList> createState() => _JokesListState();
}

class _JokesListState extends State<JokesList> {
  List<Joke> jokes = [];

  @override
  void initState(){
    super.initState();
    ApiService.fetchJokes(widget.jokeType).then((data){
      setState(() {
        jokes= data;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: "${widget.jokeType} Jokes",),
      body: JokesListView(jokes: jokes)
    );
  }
}