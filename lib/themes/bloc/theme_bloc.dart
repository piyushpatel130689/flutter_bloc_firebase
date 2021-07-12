import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitialState());

  bool isDarkMode = false;

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChangeEvent) {
      isDarkMode = event.themeData == ThemeData.dark();
      print('MODE--------$isDarkMode');
      yield ThemeChangeState(event.themeData);
    }
  }
}
