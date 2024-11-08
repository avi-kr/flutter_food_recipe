import 'dart:convert';

import 'package:http/http.dart' as http;

class RecipeRemoteDataSource {
  final String apiURL = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  Future<List<dynamic>> fetchRecipes() async {
    final response = await http.get(Uri.parse(apiURL));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['meals'];
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
