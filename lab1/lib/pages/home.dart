import 'package:flutter/material.dart';
import 'package:clothing_app/models/clothes_item.dart';
import 'package:clothing_app/pages/details.dart';
import '../data/clothes_data_holder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> clickedStates = List.generate(DataHolder.clothes.length, (_) => false);

  @override
  Widget build(BuildContext context) {
    final List<ClothesItem> clothes = DataHolder.clothes;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('211161'),
        backgroundColor: Colors.pinkAccent[400],
        elevation: 20,
        shadowColor: Colors.black,
        leading: const Icon(Icons.menu),
      ),
      body: GridView.builder(
        itemCount: clothes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          bool isClicked = clickedStates[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                clickedStates[index] = !isClicked;
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(item: clothes[index]),
                ),
              ).then((_) {
                setState(() {
                  clickedStates[index] = false;
                });
              });
            },
            child: Card(
              color: isClicked ? Colors.pink[300] : Colors.grey[100],
              shadowColor: Colors.black,
              elevation: isClicked ? 15 : 10,
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Image.asset(
                      clothes[index].imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      clothes[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
