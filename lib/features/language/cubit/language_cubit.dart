import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState(Locale('en'))) {
    loadSavedLanguage();
  }

  Future<void> loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String? langCode = prefs.getString('interface_language');

    if (langCode != null) {
      emit(LanguageState(Locale(langCode)));
    } else {
      emit(const LanguageState(Locale('en')));
    }
  }

  Future<void> changeInterfaceLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('interface_language', langCode);
    emit(LanguageState(Locale(langCode)));
  }
}
