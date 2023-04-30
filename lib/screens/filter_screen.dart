import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final Function changeFilter;
  final Map<String, bool> allFilters;
  const FilterScreen(
      {super.key, required this.changeFilter, required this.allFilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late bool _isGlutenFree = widget.allFilters['isGlutenFree']!;
  late bool _isLactoseFree = widget.allFilters['isLactoseFree']!;
  late bool _isVegetarian = widget.allFilters['isVegetarian']!;
  late bool _isVegan = widget.allFilters['isVegan']!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Switch(
                  value: _isGlutenFree,
                  onChanged: (value) {
                    widget.changeFilter(1);
                    setState(() {
                      _isGlutenFree = value;
                    });
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "GlutenFree",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            Row(
              children: [
                Switch(
                  value: _isLactoseFree,
                  onChanged: (value) {
                    widget.changeFilter(2);
                    setState(() {
                      _isLactoseFree = value;
                    });
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "LactoseFree",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            Row(
              children: [
                Switch(
                  value: _isVegetarian,
                  onChanged: (value) {
                    widget.changeFilter(3);
                    setState(() {
                      _isVegetarian = value;
                    });
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Vegetarian",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            Row(
              children: [
                Switch(
                  value: _isVegan,
                  onChanged: (value) {
                    widget.changeFilter(4);
                    setState(() {
                      _isVegan = value;
                    });
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Vegan",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
