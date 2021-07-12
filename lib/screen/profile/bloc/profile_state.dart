part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.fieldVal = "",
  });

  final String fieldVal;

  @override
  List<Object> get props => [fieldVal];

  ProfileState copyWith({
    bool? isDarkTheme,
  }) {
    return ProfileState(
      fieldVal: fieldVal ?? this.fieldVal,
    );
  }
}
