part of 'language_cubit.dart';

class LanguageState {
  final Locale selectedLocale;

  const LanguageState(this.selectedLocale);
}

class LanguageInitial extends LanguageState {
  const LanguageInitial() : super(const Locale('en'));
}
