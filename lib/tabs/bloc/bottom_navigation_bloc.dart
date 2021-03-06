import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:piyush_flutter_bloc/lib.dart';

part 'bottom_navigation_event.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc({required this.profilePageRepository})
      : assert(profilePageRepository != null),
        super(PageLoading());

  final ProfilePageRepository profilePageRepository;
  int currentIndex = 0;

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
        //String data = await _getFirstPageData();
        yield FirstPageLoaded(text: '');
      }
      if (this.currentIndex == 1) {
        //int data = await _getSecondPageData();
        yield SecondPageLoaded(number: 0);
      }
    }
  }

// Future<String> _getFirstPageData() async {
//   String data = homePageRepository.data;
//   if (data == null) {
//     await homePageRepository.fetchData();
//     data = homePageRepository.data;
//   }
//   return data;
// }

// Future<int> _getSecondPageData() async {
//   int data = profilePageRepository.data;
//   if (data == null) {
//     await profilePageRepository.fetchData();
//     data = profilePageRepository.data;
//   }
//   return data;
// }
}
