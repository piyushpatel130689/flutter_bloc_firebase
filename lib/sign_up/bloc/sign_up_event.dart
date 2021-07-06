part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class ProfileImageChanged extends SignUpEvent {
  const ProfileImageChanged({required this.image});

  final String image;

  @override
  List<Object> get props => [image];
}

class EmailChanged extends SignUpEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends SignUpEvent {}

class PasswordChanged extends SignUpEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends SignUpEvent {}

class ConfirmPasswordChanged extends SignUpEvent {
  const ConfirmPasswordChanged({required this.confirmPassword});

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class ConfirmPasswordUnfocused extends SignUpEvent {}

class PasswordObscureChanged extends SignUpEvent {
  const PasswordObscureChanged({required this.isObscure});

  final bool isObscure;

  @override
  List<Object> get props => [isObscure];
}

class FormSubmitted extends SignUpEvent {}
