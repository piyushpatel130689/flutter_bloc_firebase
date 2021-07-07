import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/common/sizeconfig.dart';
import 'package:piyush_flutter_bloc/home/bloc/user_bloc.dart';
import 'home_from.dart';
import '../../data/repositories/user_repository.dart';

class HomePage extends StatelessWidget {
  final UserRepository userRepository;

  const HomePage({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: Padding(
          padding: const EdgeInsets.all(SizeConfig.screenPadding),
          child: BlocProvider<UserBloc>(
            create: (context) => UserBloc(
              userRepository: userRepository,
            )..add(HomeStarted()),
            child: HomeForm(),
          )),
    );
  }
}
