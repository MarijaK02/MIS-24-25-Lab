import 'dart:convert';

import "package:http/http.dart" as http;

import '../models/joke.dart';

class ApiService {
  static Future<List<String>> fetchJokeTypes() async {
    var response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/types"));
    if (response.statusCode == 200) {
      List<String> data = List.from(json.decode(response.body));
      print(data);
      return data;
    } else {
      throw Exception("Failed to load joke types!");
    }
  }

  static Future<List<Joke>> fetchJokes(String type) async {
    var response = await http.get(
        Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      return (data as List).map((jokeJson) => Joke.fromJson(jokeJson)).toList();
    } else {
      throw Exception("Failed to load jokes!");
    }
  }

  static Future<Joke> fetchRandomDailyJoke() async {
    var response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/jokes/random/"));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      Joke joke = Joke.fromJson(jsonData);
      print(joke);
      return joke;
    } else {
      throw Exception("Failed to load random joke!");
    }
  }
}
