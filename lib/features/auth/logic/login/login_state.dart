part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class SignInSuccess extends LoginState {}
final class SignInLoading extends LoginState {}
final class SignInFailure extends LoginState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}