import 'package:recipe/data/data_sources/remote/recipe_remote_data_source.dart';

class FetchRecipesUseCase {
  final RecipeRemoteDataSource dataSource;

  FetchRecipesUseCase(this.dataSource);

  Future<List<dynamic>> execute() {
    return dataSource.fetchRecipes();
  }

}