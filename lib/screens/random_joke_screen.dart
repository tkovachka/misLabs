import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_service.dart';
import '../widgets/random_joke.dart';

class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({super.key});

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  Joke? randomJoke;

  @override
  void initState() {
    super.initState();
    fetchRandomJoke();
  }

  void fetchRandomJoke() async {
    try {
      final response = await ApiService.getRandomJoke();
      setState(() {
        randomJoke = Joke.fromJson(response);
      });
    } catch (e) {
      print("Error fetching random joke: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Joke"),
      ),
      body: randomJoke == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
            padding: const EdgeInsets.all(16.0),
            child: RandomJokeWidget(joke: randomJoke!),
          ),
    );
  }
}
