import 'package:flutter/material.dart';
import '../models/joke.dart';

class RandomJokeWidget extends StatelessWidget {
  final Joke joke;

  const RandomJokeWidget({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(joke.setup, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16.0),
          Text(joke.punchline, style: const TextStyle(fontSize: 24, fontStyle: FontStyle.italic,color: Colors.red)),
        ],
      ),
    );
  }
}
