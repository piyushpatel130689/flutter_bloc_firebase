import 'package:flutter/widgets.dart';
import 'package:piyush_flutter_bloc/app/bloc/app_bloc.dart';
import 'package:piyush_flutter_bloc/login/view/login_page.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      //return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
