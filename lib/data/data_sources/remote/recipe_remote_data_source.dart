import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe/core/shared/app_strings.dart';

class RecipeRemoteDataSource {
  final String apiUrl = AppStrings.recipePath;

  Future<List<dynamic>> fetchRecipes() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // print(data);
      return data[AppStrings.jsonKeyMeals];
    } else {
      throw Exception(AppStrings.recipeNetworkError);
    }
  }
}
