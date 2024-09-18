part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class SignUpLoading extends RegisterState {
  
}

final class SignUpFailure extends RegisterState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class SignUpSuccess extends RegisterState {
  final String message;

  SignUpSuccess({required this.message});
}