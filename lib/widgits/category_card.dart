import 'package:flutter/material.dart';

import 'package:recipebook/model/category.dart';
import 'package:recipebook/model/recipe.dart';

import 'package:recipebook/screens/recipe_list_screen.dart';

class CatergoryCard extends StatelessWidget {
  final Category category;
  final List<Recipe> allRecipes;

  const CatergoryCard(
      {super.key, required this.category, required this.allRecipes});

  void _addRecipeListScreen(BuildContext context, Category categoryitem) {
    List<Recipe> recipes = allRecipes
        .where((element) => element.categories.contains(categoryitem.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (bctx) {
          return RecipeListScreen(
            categoryType: categoryitem,
            recipeList: recipes,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: category.color.withOpacity(.4),
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        _addRecipeListScreen(context, category);
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                colors: [category.color.withOpacity(.5), category.color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          padding: const EdgeInsets.all(10),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
