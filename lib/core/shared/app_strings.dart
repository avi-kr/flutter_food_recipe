class AppStrings {
  static const String appTitle = 'Food Recipe App';
  static const String appHomeTitle = 'Home';
  static const String loading = 'Loading...';
  static const String favouriteRecipes = 'Favourite Recipes';
  static const String noDataAvailable = 'No Data Available';

  ///  Error String  ///
  static const String networkError =
      'Network Error: Please check your connection.';
  static const String databaseError = 'Database Error: Something went wrong.';
  static const String unexpectedError = 'An unexpected error occurred.';
  static const String recipeBlocError = 'Error creating RecipeBloc:';
  static const String recipeNetworkError = 'Failed to load recipes';

  ///  Networking Keys  ///

  /// Recipe Model ///
  static const String jsonKeyMeals = 'meals';
  static const String jsonKeyIdMeal = 'idMeal';
  static const String jsonKeyStrMeal = 'strMeal';
  static const String jsonKeyStrMealThumb = 'strMealThumb';
  static const String jsonKeyStrInstructions = 'strInstructions';

  ///  Networking Keys  ///

  ///  Database Keys  ///
  static const String dbName = 'recipes.db';
  static const String dbTableNameRecipe = 'recipes';

  ///  Database Keys  ///

  ///  Database Queries  ///
  static const String createRecipeTable = '''
      CREATE TABLE recipes (
        id INTEGER PRIMARY KEY,
        title TEXT,
        imageUrl TEXT,
        instructions TEXT
      )
    ''';

  ///  Database Queries  ///

  ///  Cache Preference  ///

  static const preKeyIsFirstTime = 'isFirstTime';

  ///  Cache Preference  ///

  ///  Screen Path  ///
  static const screenPathSplash = '/';
  static const screenPathIntro = '/intro';
  static const screenPathHome = '/home';

  ///  Url Path  ///

  static const recipePath =
      'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  ///  Url Path  ///
}
