import 'package:recipe/core/shared/app_strings.dart';
import 'package:recipe/domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  RecipeModel({
    required String id,
    required String title,
    required String imageUrl,
    required String instructions,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          instructions: instructions,
        );

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json[AppStrings.jsonKeyIdMeal] ?? '',
      // Ensure the key matches the JSON structure
      title: json[AppStrings.jsonKeyStrMeal] ?? '',
      imageUrl: json[AppStrings.jsonKeyStrMealThumb] ?? '',
      instructions: json[AppStrings.jsonKeyStrInstructions] ?? '',
    );
  }
}
