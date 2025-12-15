import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SortType { stars, updated }

final sortProvider = StateNotifierProvider<SortNotifier, SortType>((ref) {
  return SortNotifier();
});

class SortNotifier extends StateNotifier<SortType> {
  SortNotifier() : super(SortType.stars) {
    _load();
  }

  void toggle() {
    state = state == SortType.stars ? SortType.updated : SortType.stars;
    _save();
  }

  void _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('sort', state.name);
  }

  void _load() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('sort');
    if (value != null) {
      state = SortType.values.byName(value);
    }
  }
}
