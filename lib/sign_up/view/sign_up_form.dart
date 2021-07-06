import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:piyush_flutter_bloc/common/add_image_form.dart';
import 'package:piyush_flutter_bloc/common/auth_text_field.dart';
import 'package:piyush_flutter_bloc/common/sizeconfig.dart';
import 'package:piyush_flutter_bloc/sign_up/bloc/sign_up_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.status.isSubmissionSuccess) {
            Navigator.of(context).pop();
          } else if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Sign Up Failure')),
              );
          }
        },
        child: Align(
            alignment: const Alignment(0, -1 / 3),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _ImageField(),
                  const SizedBox(height: SizeConfig.verticalSizeBoxSpace * 2),
                  _EmailInput(),
                  const SizedBox(height: SizeConfig.verticalSizeBoxSpace),
                  _PasswordInput(),
                  const SizedBox(height: SizeConfig.verticalSizeBoxSpace),
                  _ConfirmPasswordInput(),
                  const SizedBox(height: SizeConfig.verticalSizeBoxSpace),
                  _SignUpButton(),
                ],
              ),
            )));
  }
}

class _ImageField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.image != current.image,
      builder: (context, state) {
        return AddImageForm(
          key: const Key('signUpForm_imageInput_profileImage'),
          imagePath: state.image,
          onChanged: (image) =>
              context.read<SignUpBloc>().add(ProfileImageChanged(image: image)),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return AuthTextField(
          labelText: 'Email',
          hint: 'Email',
          key: const Key('signUpForm_emailInput_textField'),
          isRequiredField: true,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) =>
              context.read<SignUpBloc>().add(EmailChanged(email: value)),
          error: state.email.invalid ? 'invalid email' : null,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) =>
          (previous.password != current.password ||
              previous.isObscure != current.isObscure),
      builder: (context, state) {
        return AuthTextField(
            labelText: 'Password',
            hint: 'Password',
            key: const Key('signUpForm_passwordInput_textField'),
            isPasswordField: state.isObscure,
            isRequiredField: true,
            keyboardType: TextInputType.text,
            error: state.password.invalid ? 'invalid password' : null,
            onChanged: (value) => context
                .read<SignUpBloc>()
                .add(PasswordChanged(password: value)),
            textInputAction: TextInputAction.next,
            suffixIcon: IconButton(
                icon: Icon(
                    state.isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  context
                      .read<SignUpBloc>()
                      .add(PasswordObscureChanged(isObscure: !state.isObscure));
                }));
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return AuthTextField(
          labelText: 'Confirm password',
          hint: 'Confirm password',
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          isPasswordField: false,
          isRequiredField: true,
          keyboardType: TextInputType.text,
          error:
              state.confirmedPassword.invalid ? 'passwords do not match' : null,
          onChanged: (value) => context
              .read<SignUpBloc>()
              .add(ConfirmPasswordChanged(confirmPassword: value)),
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('signUpForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: Colors.orangeAccent,
                ),
                onPressed: state.status.isValidated
                    ? () => context.read<SignUpBloc>().add(FormSubmitted())
                    : null,
                child: const Text('SIGN UP'),
              );
      },
    );
  }
}
