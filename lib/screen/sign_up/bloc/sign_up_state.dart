part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzStatus.pure,
    this.isObscure = true,
    this.image = '',
  });

  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzStatus status;
  final bool isObscure;
  final String image;

  @override
  List<Object> get props =>
      [email, password, confirmedPassword, status, isObscure, image];

  SignUpState copyWith({
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzStatus? status,
    bool? isObscure,
    String? image,
  }) {
    return SignUpState(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
        status: status ?? this.status,
        isObscure: isObscure ?? this.isObscure,
        image: image ?? this.image);
  }
}
