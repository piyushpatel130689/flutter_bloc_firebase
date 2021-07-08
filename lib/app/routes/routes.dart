import 'package:flutter/widgets.dart';
import 'package:piyush_flutter_bloc/lib.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      //return [HomePage.page()];
      return [BottomTabPage.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
