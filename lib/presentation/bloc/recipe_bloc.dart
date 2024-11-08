import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/core/utils/error_handler.dart';
import 'package:recipe/domain/use_cases/fetch_recipes_use_case.dart';

abstract class RecipeEvent {}

class FetchRecipes extends RecipeEvent {}

abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<dynamic> recipes;

  RecipeLoaded(this.recipes);
}

class RecipeError extends RecipeState {
  final String message;

  RecipeError(this.message);
}

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final FetchRecipesUseCase fetchRecipesUseCase;

  RecipeBloc(this.fetchRecipesUseCase) : super(RecipeInitial()) {
    on<FetchRecipes>(_onFetchRecipes); // Registering the event handler
  }

  Future<void> _onFetchRecipes(
      FetchRecipes event, Emitter<RecipeState> emit) async {
    emit(RecipeLoading());
    try {
      final recipes = await fetchRecipesUseCase.execute();
      emit(RecipeLoaded(recipes));
    } catch (e) {
      emit(RecipeError(ErrorHandler.handleError(e)));
    }
  }
}
