import 'package:flutter/widgets.dart';
import 'package:piyush_flutter_bloc/app/bloc/app_bloc.dart';
import 'package:piyush_flutter_bloc/screen/login/view/login_page.dart';
import 'package:piyush_flutter_bloc/tabs/view/bottomtab_page.dart';

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
