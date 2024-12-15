import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://official-joke-api.appspot.com";

  static Future<http.Response> getJokeTypes() async {
     return await http.get(Uri.parse("$baseUrl/types"));
  }

  static Future<dynamic> getJokesByType(String type) async {
    final response = await http.get(Uri.parse("$baseUrl/jokes/$type/ten"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load jokes for type $type :(");
    }
  }

  static Future<dynamic> getRandomJoke() async {
    final response = await http.get(Uri.parse("$baseUrl/random_joke"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load random joke!");
    }
  }
}
