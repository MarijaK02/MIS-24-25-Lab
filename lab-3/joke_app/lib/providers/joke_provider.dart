import 'package:flutter/material.dart';
import 'package:joke_app/models/joke.dart';

class JokeProvider with ChangeNotifier {
  List<Joke> jokes = [];

 void setJokes(List<Joke> jokeList){
    jokes.addAll(jokeList);
 }

  void toggleFavorite(int id) {
    Joke joke = jokes.firstWhere((j) => j.id == id);
    joke.isFavorite = !joke.isFavorite;
    notifyListeners();
  }
}
