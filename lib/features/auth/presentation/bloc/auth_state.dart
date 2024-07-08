part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState{}
final class AuthSuceess extends AuthState{
  final String success;
  const AuthSuceess(this.success);
}
final class AuthFailure extends AuthState{
  final String message;
 const  AuthFailure(this.message);
}

