import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        pageIndex: _pageIndex,
      ),
      appBar: AppBar(
        title: Text(
          _pageIndex == 0 ? "Recipe Book" : "Favorites",
        ),
      ),
      body: _pageIndex == 0 ? const CategotiesScreen() : const FavoriteScreen(),
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
