
import 'package:flutter/material.dart';
import 'package:joke_app/services/api_service.dart';
import 'package:provider/provider.dart';
import 'package:joke_app/widgets/joke_card.dart';
import '../models/joke.dart';
import '../providers/joke_provider.dart';
import '../widgets/navbar.dart';

class Jokes extends StatefulWidget {
  final String jokeType;

  const Jokes({super.key, required this.jokeType});

  @override
  State<Jokes> createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  late Future<List<Joke>> jokeList;

  @override
  void initState(){
    super.initState();
    jokeList = ApiService.fetchJokes(widget.jokeType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(title: "Jokes"),
      body: FutureBuilder<List<Joke>>(
        future: jokeList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("No jokes available"));
          } else if (snapshot.hasData) {
            final jokeProvider = Provider.of<JokeProvider>(context, listen: true);
            final currentJokes = jokeProvider.jokes;

            if (!currentJokes.any((joke) => joke.type == widget.jokeType)) {
              jokeProvider.setJokes(snapshot.data!);
            }

            List<Joke> jokes = context.watch<JokeProvider>().jokes.where((j) => j.type == widget.jokeType).toList();
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return JokeCard(
                    joke: jokes[index]
                );
              },
            );
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
