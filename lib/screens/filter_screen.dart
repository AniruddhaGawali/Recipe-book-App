import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipebook/provider/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(filterProvider);
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
                  value: ref.watch(filterProvider)[Filter.glutenFree]!,
                  onChanged: (value) {
                    ref
                        .read(filterProvider.notifier)
                        .toggleFilter(Filter.glutenFree);
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
                  value: ref.watch(filterProvider)[Filter.lactoseFree]!,
                  onChanged: (value) {
                    ref
                        .read(filterProvider.notifier)
                        .toggleFilter(Filter.lactoseFree);
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
                  value: ref.watch(filterProvider)[Filter.vegetarian]!,
                  onChanged: (value) {
                    ref
                        .read(filterProvider.notifier)
                        .toggleFilter(Filter.vegetarian);
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
                  value: ref.watch(filterProvider)[Filter.vegan]!,
                  onChanged: (value) {
                    ref
                        .read(filterProvider.notifier)
                        .toggleFilter(Filter.vegan);
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
