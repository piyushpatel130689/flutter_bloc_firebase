import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/models/user_model.dart';

part 'user_state.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.userRepository}) : super(UserInitialState());

  UserRepository userRepository;

  @override
  UserState get initialState => UserInitialState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserInitialState) {
    } else if (event is FetchUserEvent || event is HomeStarted) {
      yield UserLoadingState();
      try {
        List<UserModel> users = await userRepository.fetchUsers();
        yield UserLoadedState(users: users);
      } catch (e) {
        yield UserErrorState(message: e.toString());
      }
    }
  }
}
