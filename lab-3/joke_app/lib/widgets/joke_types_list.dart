import 'package:flutter/material.dart';

class JokeTypesList extends StatelessWidget {
  final List<String> jokeTypes;

  JokeTypesList({super.key, required this.jokeTypes});

  final List<IconData> icons = [
    Icons.all_out,
    Icons.door_front_door,
    Icons.computer,
    Icons.man
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokeTypes.length,
      itemBuilder: (context, index) {
        return ListTile(
          tileColor: Colors.deepPurple[(index + 1) * 100],
          iconColor: Colors.white,
          minTileHeight: 203,
          titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Icon(
                    icons[index],
                    size: 100,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(jokeTypes[index],
                      style: const TextStyle(fontWeight: FontWeight.w400)),
                  const Text(
                    "Click for more!",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, '/jokes', arguments: jokeTypes[index]);
          },
        );
      },
    );
  }
}
