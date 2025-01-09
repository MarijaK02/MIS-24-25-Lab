import 'package:flutter/material.dart';

import '../services/api_service.dart';
import '../widgets/joke_types_list.dart';
import '../widgets/navbar.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<String>> jokeTypes;

  @override
  void initState(){
    super.initState();
    jokeTypes = ApiService.fetchJokeTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(title: "Random joke"),
      body: FutureBuilder<List<String>>(
          future: jokeTypes,
          builder: (context, snapshot){
            if(snapshot.hasError){
              return const Center(
                child: Text("There are no jokeTypes"));
            }else if(snapshot.hasData){
              return JokeTypesList(jokeTypes: snapshot.data!);
            }

            return const CircularProgressIndicator();
          }
      )
    );
  }
}
