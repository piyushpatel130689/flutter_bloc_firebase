import 'dart:async';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../common/confirmPassword.dart';
import '../../common/email.dart';
import '../../common/Password.dart';

part 'sign_up_state.dart';

part 'sign_up_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._authenticationRepository) : super(const SignUpState());
  final AuthenticationRepository _authenticationRepository;

  @override
  void onTransition(Transition<SignUpEvent, SignUpState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is ProfileImageChanged) {
      final String profileImage = event.image;
      yield state.copyWith(
        image: profileImage,
      );
    }else if (event is EmailChanged) {
      final email = Email.dirty(event.email);
      yield state.copyWith(
        //email: email.valid ? email : Email.pure(event.email),
        email: email,
        status:
            Formz.validate([email, state.password, state.confirmedPassword]),
      );
    } else if (event is EmailUnfocused) {
      final email = Email.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status:
            Formz.validate([email, state.password, state.confirmedPassword]),
      );
    } else if (event is PasswordChanged) {
      final password = Password.dirty(event.password);
      final confirmedPassword = ConfirmedPassword.dirty(
        password: password.value,
        value: state.confirmedPassword.value,
      );

      yield state.copyWith(
        //password: password.valid ? password : Password.pure(event.password),
        password: password,
        confirmedPassword: confirmedPassword,
        status:
            Formz.validate([state.email, password, state.confirmedPassword]),
      );
    } else if (event is PasswordUnfocused) {
      final password = Password.dirty(state.password.value);
      yield state.copyWith(
        password: password,
        status:
            Formz.validate([state.email, password, state.confirmedPassword]),
      );
    } else if (event is ConfirmPasswordChanged) {
      final confirmedPassword = ConfirmedPassword.dirty(
        password: state.password.value,
        value: event.confirmPassword,
      );

      yield state.copyWith(
        //confirmedPassword: confirm_password.valid ? confirm_password : Password.pure(event.confirm_password),
        confirmedPassword: confirmedPassword,
        status:
            Formz.validate([state.email, state.password, confirmedPassword]),
      );
    } else if (event is ConfirmPasswordUnfocused) {
      final confirmedPassword = ConfirmedPassword.dirty(
        password: state.password.value,
        value: state.confirmedPassword.value,
      );
      yield state.copyWith(
        confirmedPassword: confirmedPassword,
        status:
            Formz.validate([state.email, state.password, confirmedPassword]),
      );
    } else if (event is PasswordObscureChanged) {
      final isObscure = event.isObscure;
      yield state.copyWith(
        isObscure: isObscure,
      );
    } else if (event is FormSubmitted) {
      final email = Email.dirty(state.email.value);
      final password = Password.dirty(state.password.value);
      final confirmedPassword = ConfirmedPassword.dirty(
        password: state.password.value,
        value: state.confirmedPassword.value,
      );

      yield state.copyWith(
        email: email,
        password: password,
        confirmedPassword: confirmedPassword,
        status: Formz.validate([email, password, confirmedPassword]),
      );
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        //await Future<void>.delayed(const Duration(seconds: 1));

        try {
          await _authenticationRepository.signUp(
            email: state.email.value,
            password: state.password.value,
          );
          yield state.copyWith(status: FormzStatus.submissionSuccess);
        } on Exception {
          yield state.copyWith(status: FormzStatus.submissionFailure);
        }
      }
    }
  }

// Future<void> signUpFormSubmitted() async {
//   if (!state.status.isValidated) return;
//   emit(state.copyWith(status: FormzStatus.submissionInProgress));
//   try {
//     await _authenticationRepository.signUp(
//       email: state.email.value,
//       password: state.password.value,
//     );
//     emit(state.copyWith(status: FormzStatus.submissionSuccess));
//   } on Exception {
//     emit(state.copyWith(status: FormzStatus.submissionFailure));
//   }
// }
}
