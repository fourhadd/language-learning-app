import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  Future<void> saveLanguage(String languageName) async {
    emit(LanguageLoading());

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_language', languageName);

      emit(LanguageSuccess(languageName));
    } catch (e) {
      emit(LanguageError("Dili yadda saxlamaq mümkün olmadı"));
    }
  }
}
