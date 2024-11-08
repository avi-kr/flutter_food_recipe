import 'package:recipe/core/shared/app_strings.dart';

class Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final String instructions;

  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.instructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json[AppStrings.jsonKeyIdMeal] ?? '', // Ensure the key matches the JSON structure
      title: json[AppStrings.jsonKeyStrMeal] ?? '',
      imageUrl: json[AppStrings.jsonKeyStrMealThumb] ?? '',
      instructions: json[AppStrings.jsonKeyStrInstructions] ?? '',
    );
  }
}
