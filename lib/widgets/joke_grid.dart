import 'package:flutter/material.dart';
import 'joke_card.dart';

class JokeGrid extends StatelessWidget {
  final List<String> jokeTypes;

  const JokeGrid({super.key, required this.jokeTypes});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: jokeTypes.map((type) {
        return InkWell(
          onTap: () => Navigator.pushNamed(context, '/jokes', arguments: type),
          child: Card(
            color: Colors.redAccent,
            child: Center(
              child: Text(
                type.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
