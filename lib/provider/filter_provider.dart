import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super(
          {
            Filter.glutenFree: false,
            Filter.lactoseFree: false,
            Filter.vegan: false,
            Filter.vegetarian: false
          },
        );

  void toggleFilter(Filter filter) {
    if (state[filter]!) {
      state = {...state, filter: false};
    } else {
      state = {...state, filter: true};
    }
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>((ref) {
  return FilterNotifier();
});
