import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/core/shared/app_strings.dart';
import 'package:recipe/core/utils/cache_image_util.dart';
import 'package:recipe/domain/entities/recipe.dart';
import 'package:recipe/presentation/bloc/recipe_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appHomeTitle)),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecipeLoaded) {
            List<Recipe> recipes = (state.recipes as List)
                .map((item) => Recipe.fromJson(item))
                .toList();

            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CacheImageUtil.loadImage(recipes[index].imageUrl,
                      width: 48, height: 48),
                  title: Text(recipes[index].title),
                );
              },
            );
          } else if (state is RecipeError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text(AppStrings.noDataAvailable));
          }
        },
      ),
    );
  }
}
