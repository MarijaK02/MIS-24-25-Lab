import 'package:flutter/material.dart';

import '../services/api_service.dart';
import '../widgets/joke_types_list_view.dart';
import '../widgets/navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    ApiService.fetchJokeTypes().then((data) {
      setState(() {
        jokeTypes = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const NavBar(title: "Choose the type"),
        body: JokeTypesListView(jokeTypes: jokeTypes)
    );
  }
}
