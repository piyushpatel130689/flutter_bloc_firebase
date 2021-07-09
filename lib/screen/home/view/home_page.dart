import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/lib.dart';

class HomePage extends StatelessWidget {
  final UserRepository userRepository;
  final Function()? onNext;

  const HomePage({Key? key, required this.userRepository, this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: Padding(
          padding: const EdgeInsets.only(
              left: SizeConfig.screenPadding,
              right: SizeConfig.screenPadding,
              top: SizeConfig.screenPadding),
          child: BlocProvider<UserBloc>(
            create: (context) => UserBloc(
              userRepository: userRepository,
            )..add(HomeStarted()),
            child: HomeBody(onNext: onNext,),
          )),
    );
  }
}
