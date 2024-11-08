import 'dart:convert';

import 'package:http/http.dart' as http;

class RecipeRemoteDataSource {
  final String apiUrl = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  Future<List<dynamic>> fetchRecipes() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data); // Print the JSON data to see the structure
      return data['meals'];
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
