import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/joke.dart';
import '../providers/joke_provider.dart';

class JokeCard extends StatefulWidget {
  final Joke joke;
  final bool isRandomJoke; // to differentiate between random joke and list item

  const JokeCard({
    super.key,
    required this.joke,
    this.isRandomJoke = false,
  });

  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.isRandomJoke) {
          setState(() {
            expanded = !expanded;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            widget.joke.setup,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: expanded || widget.isRandomJoke
              ? Text(
            widget.joke.punchline,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          )
              : null,
          contentPadding: const EdgeInsets.all(20),
          minVerticalPadding: 15,
          tileColor: Colors.purple[50],
          trailing: widget.isRandomJoke ? null : IconButton(
            icon: Icon(
              widget.joke.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.joke.isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              Provider.of<JokeProvider>(context, listen: false).toggleFavorite(widget.joke.id);
            },
          ),
        ),
      ),
    );
  }
}
