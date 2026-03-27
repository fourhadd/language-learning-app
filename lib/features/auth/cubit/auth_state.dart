part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String? userName;
  AuthSuccess({this.userName});
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthLoggedOut extends AuthState {}
