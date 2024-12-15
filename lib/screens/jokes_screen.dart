import 'package:flutter/material.dart';
import '../widgets/joke_card.dart';
import '../models/joke.dart';
import '../services/api_service.dart';

class JokesScreen extends StatefulWidget {
  final String jokeType;

  const JokesScreen({super.key, required this.jokeType});

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  List<Joke> jokes = [];

  @override
  void initState() {
    super.initState();
    fetchJokes();
  }

  void fetchJokes() async {
    try {
      final response = await ApiService.getJokesByType(widget.jokeType);
      setState(() {
        jokes = response.map<Joke>((json) => Joke.fromJson(json)).toList();
      });
    } catch (e) {
      print("Error fetching jokes: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.jokeType} Jokes"),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return JokeCard(
            joke: joke,
          );
        },
      ),
    );
  }
}
