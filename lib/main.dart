import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/presentation/bloc/recipe_bloc.dart';
import 'package:recipe/presentation/screens/home_screen.dart';
import 'package:recipe/presentation/screens/splash_screen.dart';

import 'data/data_sources/remote/recipe_remote_data_source.dart';
import 'domain/use_cases/fetch_recipes_use_case.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            try {
              final bloc =
                  RecipeBloc(FetchRecipesUseCase(RecipeRemoteDataSource()));
              bloc.add(FetchRecipes());
              return bloc;
            } catch (e) {
              print('Error creating RecipeBloc: $e');
              throw e; // Rethrow after logging for debugging
            }
          },
        ),
      ],
      child: MaterialApp(
        title: 'Food Recipe App',
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => HomeScreen(),
          // Add routes for other screens here
        },
      ),
    );
  }
}
