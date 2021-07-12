part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.isDarkTheme = false,
  });

  final bool isDarkTheme;

  @override
  List<Object> get props => [isDarkTheme];

  ProfileState copyWith({
    bool? isDarkTheme,
  }) {
    return ProfileState(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }
}
