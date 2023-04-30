import 'package:flutter/material.dart';
import 'package:recipebook/model/recipe.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipebook/provider/favorite_recipe_provider.dart';

class RecipeScreen extends ConsumerWidget {
  final Recipe recipe;
  const RecipeScreen({
    super.key,
    required this.recipe,
  });

  String get _getComplexity {
    return recipe.complexity.name[0].toUpperCase() +
        recipe.complexity.name.substring(1);
  }

  String get _getAffordability {
    return recipe.affordability.name[0].toUpperCase() +
        recipe.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe.title,
        ),
        actions: [
          InkWell(
            onTap: () {
              final isAdded = ref
                  .read(favoriteRecipeProvider.notifier)
                  .toggleFavoriteRecipe(recipe);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isAdded ? "Recipe added as a Favorite" : "Recipe Removed",
                  ),
                ),
              );
            },
            child: const Icon(Icons.star),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: ValueKey(recipe.id),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    recipe.imageUrl,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Hero(
                tag: recipe.id,
                child: Text(
                  recipe.title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.visible),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.alarm,
                  ),
                  Text(
                    " ${recipe.duration.toString()} min",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.work),
                  Text(
                    " $_getComplexity",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.attach_money),
                  Text(
                    " $_getAffordability",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ingredients",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...recipe.ingredients.map((ingredient) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              child: Text(
                                ingredient,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(overflow: TextOverflow.ellipsis),
                              ),
                            );
                          }).toList()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Step",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...recipe.steps.map((step) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 10),
                              child: Text(
                                step,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(overflow: TextOverflow.visible),
                              ),
                            );
                          }).toList()
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
