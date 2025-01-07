import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const NavBar({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/random-joke");
            },
            icon: const Icon(Icons.celebration))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}