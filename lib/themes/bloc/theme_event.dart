part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChangeEvent extends ThemeEvent {
  const ThemeChangeEvent({required this.themeData});

  final ThemeData themeData;

  @override
  List<Object> get props => [themeData];
}
