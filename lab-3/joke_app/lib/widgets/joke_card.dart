import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/joke.dart';

class JokeCard extends StatelessWidget{
  final Joke joke;
  const JokeCard({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(// Background color
            borderRadius: BorderRadius.circular(10.0), // Optional rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
                spreadRadius: 2, // How much the shadow spreads
                blurRadius: 5, // How soft the shadow is
                offset: Offset(2, 3), // Offset in the X and Y directions
              ),
            ],
          ),
          child: ListTile(
            tileColor: Colors.purple[200],
            minTileHeight: 100,
            titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),
            subtitleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
            ),
            title: Text(joke.setup),
            subtitle: Text(joke.punchline)
          ),
        )
    );
  }

}