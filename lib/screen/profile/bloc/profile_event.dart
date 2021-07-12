part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ProfileEvent {
  const ThemeChanged({required this.isDarkTheme});

  final bool isDarkTheme;

  @override
  List<Object> get props => [isDarkTheme];
}
