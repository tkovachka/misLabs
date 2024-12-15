import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/jokes_screen.dart';
import 'screens/random_joke_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/jokes': (context) => JokesScreen(jokeType: ModalRoute.of(context)!.settings.arguments as String),
        '/randomJoke': (context) => const RandomJokeScreen(),
      },
    );
  }
}
