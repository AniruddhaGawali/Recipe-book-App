import 'package:flutter/material.dart';

import 'package:recipebook/screens/recipe_list_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipebook/provider/recipes_provider.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: RecipeListScreen(
        recipeList: ref.watch(favoriteFilteredRecipe),
      ),
    );
  }
}
