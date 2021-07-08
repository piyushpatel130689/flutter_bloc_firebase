import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/lib.dart';

class BottomTabPage extends StatelessWidget {
  const BottomTabPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: BottomTabPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<BottomNavigationBloc>(
      create: (context) => BottomNavigationBloc(
        profilePageRepository: ProfilePageRepository(),
      )..add(AppStarted()),
      child: NavigationPage(),
    ));
  }
}
