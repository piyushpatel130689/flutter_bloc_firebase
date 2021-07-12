part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitialState extends ThemeState {}


class ThemeChangeState extends ThemeState {
  final ThemeData themeData;

  ThemeChangeState(this.themeData);

  @override
  List<Object> get props => [themeData];
}
