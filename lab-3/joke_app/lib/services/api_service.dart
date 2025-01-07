import 'dart:convert';
import "package:http/http.dart" as http;

import '../models/joke.dart';


class ApiService{
  static Future<dynamic> fetchJokeTypes() async{
    var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/types"));
    if(response.statusCode == 200){
      print("Response: ${response.body}");
      List<String> data = List.from(json.decode(response.body));
      return data;
    }else{
      throw Exception("Failed to load joke types!");
    }
  }

  static Future<dynamic> fetchJokes(String type) async{
    var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));
    if(response.statusCode == 200){
      List<dynamic> jsonData = json.decode(response.body);
      List<Joke> data = jsonData.map((jokeJson) => Joke.fromJson(jokeJson)).toList();
      print(data);
      return data;
    }else{
      throw Exception("Failed to load jokes!");
    }
  }
  
  static Future<dynamic> fetchRandomDailyJoke() async{
    var response = await http.get(Uri.parse("https://official-joke-api.appspot.com/jokes/random/"));
    if(response.statusCode == 200){
      var jsonData = json.decode(response.body);
      Joke joke = Joke.fromJson(jsonData);
      print(joke);
      return joke;
    }else{
      throw Exception("Failed to load random joke!");
    }
  }
}