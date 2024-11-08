import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/domain/entities/recipe.dart';
import 'package:recipe/presentation/bloc/recipe_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RecipeLoaded) {
            List<Recipe> recipes = (state.recipes as List).map((item) => Recipe.fromJson(item)).toList();

            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recipes[index].title),
                );
              },
            );
          } else if (state is RecipeError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('No Data Available'));
          }
        },
      ),
    );
  }
}