import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:recipebook/data/dummy_data.dart';
import 'package:recipebook/model/recipe.dart';
import 'package:recipebook/screens/categories_screen.dart';
import 'package:recipebook/screens/favorite_screen.dart';
import 'package:recipebook/widgits/drawer_card.dart';

class TabScreens extends StatefulWidget {
  const TabScreens({super.key});

  @override
  State<TabScreens> createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  int _pageIndex = 0;

  final List<Recipe> _favoriteList = [];

  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  void _addToFavoriteList(Recipe recipe) {
    if (!_favoriteList.contains(recipe)) {
      setState(() {
        _favoriteList.add(recipe);
      });
    } else {
      setState(() {
        _favoriteList.remove(recipe);
      });
    }
  }

  void _changeFilter(int type) {
    switch (type) {
      case 1:
        setState(() {
          isGlutenFree = isGlutenFree ? false : true;
        });
        break;
      case 2:
        setState(() {
          isLactoseFree = isLactoseFree ? false : true;
        });
        break;
      case 3:
        setState(() {
          isVegetarian = isVegetarian ? false : true;
        });
        break;
      case 4:
        setState(() {
          isVegan = isVegan ? false : true;
        });
        break;
      default:
    }
  }

  List<Recipe> get _allRecipes {
    List<Recipe> allRecipes = dummyRecipes;

    if (isGlutenFree) {
      allRecipes =
          allRecipes.where((Recipe recipe) => recipe.isGlutenFree).toList();
    }
    if (isLactoseFree) {
      allRecipes =
          allRecipes.where((Recipe recipe) => recipe.isLactoseFree).toList();
    }
    if (isVegan) {
      allRecipes = allRecipes.where((Recipe recipe) => recipe.isVegan).toList();
    }
    if (isVegetarian) {
      allRecipes =
          allRecipes.where((Recipe recipe) => recipe.isVegetarian).toList();
    }

    return allRecipes;
  }

  List<Recipe> get _getFavortieRecipe {
    List<Recipe> allRecipes = _favoriteList;

    if (isGlutenFree) {
      allRecipes =
          allRecipes.where((Recipe recipe) => recipe.isGlutenFree).toList();
    }
    if (isLactoseFree) {
      allRecipes =
          allRecipes.where((Recipe recipe) => recipe.isLactoseFree).toList();
    }
    if (isVegan) {
      allRecipes = allRecipes.where((Recipe recipe) => recipe.isVegan).toList();
    }
    if (isVegetarian) {
      allRecipes =
          allRecipes.where((Recipe recipe) => recipe.isVegetarian).toList();
    }

    return allRecipes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
          pageIndex: _pageIndex,
          changeFilter: _changeFilter,
          allFilters: {
            'isGlutenFree': isGlutenFree,
            'isLactoseFree': isLactoseFree,
            'isVegan': isVegan,
            'isVegetarian': isVegetarian
          }),
      appBar: AppBar(
        title: Text(
          _pageIndex == 0 ? "Recipe Book" : "Favorites",
        ),
      ),
      body: _pageIndex == 0
          ? CategotiesScreen(
              addToFavorites: _addToFavoriteList, allRecipes: _allRecipes)
          : FavoriteScreen(
              favoriteList: _getFavortieRecipe,
              addToFavorites: _addToFavoriteList,
            ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          _pageIndex = index;
        }),
        currentIndex: _pageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: "Recipe"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite")
        ],
      ),
    );
  }
}
