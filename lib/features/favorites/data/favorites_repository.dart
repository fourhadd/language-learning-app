import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/course_model.dart';

class FavoritesRepository {
  static const String _prefKey = 'user_favorites';

  Future<List<CourseModel>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favStrings = prefs.getStringList(_prefKey);

    if (favStrings == null) return [];

    return favStrings.map<CourseModel>((item) {
      final Map<String, dynamic> jsonMap =
          jsonDecode(item) as Map<String, dynamic>;
      return CourseModel.fromJson(jsonMap);
    }).toList();
  }

  Future<void> saveFavorites(List<CourseModel> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
        favorites.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList(_prefKey, jsonList);
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefKey);
  }
}
