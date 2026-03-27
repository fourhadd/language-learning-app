part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageLoading extends LanguageState {}

class LanguageSuccess extends LanguageState {
  final String selectedLanguage;
  LanguageSuccess(this.selectedLanguage);
}

class LanguageError extends LanguageState {
  final String message;
  LanguageError(this.message);
}
