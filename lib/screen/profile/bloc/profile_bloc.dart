import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/lib.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState());

  @override
  void onTransition(Transition<ProfileEvent, ProfileState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ThemeChanged) {
      final bool isDarkTheme = event.isDarkTheme;
      yield state.copyWith(
        isDarkTheme: isDarkTheme,
      );
    }
  }
}
