import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String getLocalizedError(BuildContext context, String key) {
    final lang = AppLocalizations.of(context)!;
    switch (key) {
      case "errorInvalidEmail":
        return lang.errorInvalidEmail;
      case "errorPasswordLength":
        return lang.errorPasswordLength;
      case "errorPasswordNumber":
        return lang.errorPasswordNumber;
      case "errorPasswordUpper":
        return lang.errorPasswordUpper;
      case "errorEmailExists":
        return lang.errorEmailExists;
      case "errorLoginFailed":
        return lang.errorLoginFailed;
      default:
        return lang.errorGeneral;
    }
  }

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      if (!email.contains("@") || email.length < 5) {
        emit(AuthError("errorInvalidEmail"));
        return;
      }
      if (password.length < 8) {
        emit(AuthError("errorPasswordLength"));
        return;
      }
      if (!password.contains(RegExp(r'[0-9]'))) {
        emit(AuthError("errorPasswordNumber"));
        return;
      }
      if (!password.contains(RegExp(r'[A-Z]'))) {
        emit(AuthError("errorPasswordUpper"));
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      List<String> userListStrings = prefs.getStringList('all_users') ?? [];

      bool exists = userListStrings.any((u) => jsonDecode(u)['email'] == email);
      if (exists) {
        emit(AuthError("errorEmailExists"));
        return;
      }

      Map<String, String> newUser = {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      };

      userListStrings.add(jsonEncode(newUser));
      await prefs.setStringList('all_users', userListStrings);

      await prefs.setBool('is_logged_in', true);
      await prefs.setString('current_user_email', email);

      emit(AuthSuccess(userName: firstName));
    } catch (e) {
      emit(AuthError("errorGeneral"));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> userListStrings = prefs.getStringList('all_users') ?? [];

      Map<String, dynamic>? foundUser;
      for (String userStr in userListStrings) {
        final Map<String, dynamic> user = jsonDecode(userStr);
        if (user['email'] == email && user['password'] == password) {
          foundUser = user;
          break;
        }
      }

      if (foundUser != null) {
        await prefs.setBool('is_logged_in', true);
        await prefs.setString('current_user_email', email);
        emit(AuthSuccess(userName: foundUser['firstName'] ?? "User"));
      } else {
        emit(AuthError("errorLoginFailed"));
      }
    } catch (e) {
      emit(AuthError("errorGeneral"));
    }
  }

  Future<void> deleteAccount() async {
    emit(AuthLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? currentEmail = prefs.getString('current_user_email');

      if (currentEmail != null) {
        List<String> userListStrings = prefs.getStringList('all_users') ?? [];
        userListStrings.removeWhere(
            (userStr) => jsonDecode(userStr)['email'] == currentEmail);
        await prefs.setStringList('all_users', userListStrings);
      }

      await prefs.remove('is_logged_in');
      await prefs.remove('current_user_email');

      emit(AuthInitial());
    } catch (e) {
      emit(AuthError("errorGeneral"));
    }
  }

  Future<void> checkStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;
      final String? email = prefs.getString('current_user_email');

      if (isLoggedIn && email != null) {
        List<String> userListStrings = prefs.getStringList('all_users') ?? [];
        String? firstName;

        for (String userStr in userListStrings) {
          final Map<String, dynamic> user = jsonDecode(userStr);
          if (user['email'] == email) {
            firstName = user['firstName'];
            break;
          }
        }

        if (firstName != null) {
          emit(AuthSuccess(userName: firstName));
        } else {
          await logout();
        }
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthInitial());
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', false);
    await prefs.remove('current_user_email');
    emit(AuthInitial());
  }
}
