import 'package:flutter/material.dart';
import 'package:recipebook/screens/filter_screen.dart';

class CustomDrawer extends StatelessWidget {
  final int pageIndex;
  final Function changeFilter;
  final Map<String, bool> allFilters;
  const CustomDrawer(
      {super.key,
      required this.pageIndex,
      required this.changeFilter,
      required this.allFilters});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            pageIndex == 0 ? "Recipe Book" : "Favorites",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
            },
            leading: const Icon(Icons.home_filled),
            title: Text(
              "Home",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (bctx) {
                return FilterScreen(
                    changeFilter: changeFilter, allFilters: allFilters);
              }));
            },
            leading: const Icon(Icons.filter_alt),
            title: Text(
              "Filter",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}
