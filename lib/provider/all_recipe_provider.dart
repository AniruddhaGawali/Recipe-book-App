import 'package:recipebook/data/dummy_data.dart';
import 'package:recipebook/model/recipe.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allRecipeProvider = Provider<List<Recipe>>((ref) {
  return dummyRecipes;
});
