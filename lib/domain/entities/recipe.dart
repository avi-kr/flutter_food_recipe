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
      id: json['idMeal'] ?? '', // Ensure the key matches the JSON structure
      title: json['strMeal'] ?? '',
      imageUrl: json['strMealThumb'] ?? '',
      instructions: json['strInstructions'] ?? '',
    );
  }
}
