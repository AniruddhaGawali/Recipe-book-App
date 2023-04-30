import 'package:flutter/material.dart';
import 'package:recipebook/model/recipe.dart';
import 'package:recipebook/screens/recipe_list_screen.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Recipe> favoriteList;
  final Function addToFavorites;
  const FavoriteScreen(
      {super.key, required this.favoriteList, required this.addToFavorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecipeListScreen(
        addToFavorites: addToFavorites,
        recipeList: favoriteList,
      ),
    );
  }
}
