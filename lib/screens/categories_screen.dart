import "package:flutter/material.dart";

import "package:recipebook/data/dummy_data.dart";
import "package:recipebook/model/recipe.dart";

import "package:recipebook/widgits/category_card.dart";

class CategotiesScreen extends StatelessWidget {
  final Function addToFavorites;
  final List<Recipe> allRecipes;

  const CategotiesScreen(
      {super.key, required this.addToFavorites, required this.allRecipes});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      children: [
        ...availableCategories.map((category) {
          return CatergoryCard(
              category: category,
              addToFavorites: addToFavorites,
              allRecipes: allRecipes);
        }).toList(),
      ],
    );
  }
}
