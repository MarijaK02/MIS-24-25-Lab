import 'dart:math';

import 'package:flutter/material.dart';
import '../models/joke.dart';

class JokesListView extends StatefulWidget{
  final List<Joke> jokes;
  const JokesListView({super.key, required this.jokes});

  @override
  State<JokesListView> createState() => _JokesListViewState();
}

class _JokesListViewState extends State<JokesListView> {
  List<bool> expanded = [];

  @override
  void initState() {
    super.initState();
    _initializeExpanded();
  }

  @override
  void didUpdateWidget(JokesListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.jokes != oldWidget.jokes) {
      _initializeExpanded();
    }
  }

  void _initializeExpanded() {
    expanded = List.generate(widget.jokes.length, (index) => false);
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.jokes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            setState(() {
              expanded[index] = !expanded[index];
            });
          },
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
                minTileHeight: 140,
                titleAlignment: ListTileTitleAlignment.center,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
                subtitleTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),
                title: Text(widget.jokes[index].setup),
                subtitle: expanded[index] ? Text(widget.jokes[index].punchline) : null,
              ),
            )
        );
      },
    );
  }
}