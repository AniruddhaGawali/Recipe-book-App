import 'package:flutter/material.dart';
import 'package:recipebook/model/recipe.dart';
import 'package:recipebook/screens/recipe_screen.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipeItem;
  const RecipeCard({
    super.key,
    required this.recipeItem,
  });

  String get _getComplexity {
    return recipeItem.complexity.name[0].toUpperCase() +
        recipeItem.complexity.name.substring(1);
  }

  String get _getAffordability {
    return recipeItem.affordability.name[0].toUpperCase() +
        recipeItem.affordability.name.substring(1);
  }

  void _addRecipeScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (bctx) {
      return RecipeScreen(
        recipe: recipeItem,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _addRecipeScreen(context);
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: ValueKey(recipeItem.id),
                child: Image(
                  image: NetworkImage(recipeItem.imageUrl),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black38, Colors.black12],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: recipeItem.id,
                        child: SizedBox(
                          width: 400,
                          child: Text(recipeItem.title,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.alarm,
                          ),
                          Text(
                            " : ${recipeItem.duration.toString()} min",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(Icons.work),
                          Text(
                            " : $_getComplexity",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(Icons.attach_money),
                          Text(
                            ": $_getAffordability",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
