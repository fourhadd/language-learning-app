import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      if (!email.contains("@") || email.length < 5) {
        emit(AuthError("Düzgün bir email daxil edin!"));
        return;
      }

      if (password.length < 8) {
        emit(AuthError("Şifrə ən azı 8 simvoldan ibarət olmalıdır!"));
        return;
      }

      if (!password.contains(RegExp(r'[0-9]'))) {
        emit(AuthError("Şifrədə ən azı bir rəqəm olmalıdır!"));
        return;
      }

      if (!password.contains(RegExp(r'[A-Z]'))) {
        emit(AuthError("Şifrədə ən azı bir böyük hərf olmalıdır!"));
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      List<String> userListStrings = prefs.getStringList('all_users') ?? [];

      bool exists = userListStrings.any((u) => jsonDecode(u)['email'] == email);
      if (exists) {
        emit(AuthError("Bu email artıq qeydiyyatdan keçib!"));
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

      emit(AuthSuccess(userName: firstName));
    } catch (e) {
      emit(AuthError("Qeydiyyat zamanı xəta oldu."));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
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
        emit(AuthError("Email və ya şifrə yanlışdır!"));
      }
    } catch (e) {
      emit(AuthError("Giriş zamanı xəta baş verdi."));
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', false);
    await prefs.remove('current_user_email');
    emit(AuthInitial());
  }

  Future<void> checkStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;
    final String? email = prefs.getString('current_user_email');

    if (isLoggedIn && email != null) {
      List<String> userListStrings = prefs.getStringList('all_users') ?? [];

      for (String userStr in userListStrings) {
        final Map<String, dynamic> user = jsonDecode(userStr);
        if (user['email'] == email) {
          emit(AuthSuccess(userName: user['firstName'] as String? ?? "User"));
          return;
        }
      }
    }
    emit(AuthInitial());
  }
}
