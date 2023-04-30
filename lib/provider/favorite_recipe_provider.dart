import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipebook/model/recipe.dart';

class FavoriteRecipeNotifier extends StateNotifier<List<Recipe>> {
  FavoriteRecipeNotifier() : super([]);

  bool toggleFavoriteRecipe(Recipe recipe) {
    if (!state.contains(recipe)) {
      state = [...state, recipe];
      return true;
    } else {
      state = state.where((elem) => recipe.id != elem.id).toList();
      return false;
    }
  }
}

final favoriteRecipeProvider =
    StateNotifierProvider<FavoriteRecipeNotifier, List<Recipe>>((ref) {
  return FavoriteRecipeNotifier();
});
