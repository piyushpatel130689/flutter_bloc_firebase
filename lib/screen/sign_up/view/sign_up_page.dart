import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/lib.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Sign Up',
        style: MyStyles.fontScreenTitleTextBold(),
      )),
      body: Padding(
        padding: const EdgeInsets.all(SizeConfig.screenPadding),
        child: BlocProvider(
          create: (_) => SignUpBloc(context.read<AuthenticationRepository>()),
          child: const SignUpForm(),
        ),
      ),
    );
  }
}
