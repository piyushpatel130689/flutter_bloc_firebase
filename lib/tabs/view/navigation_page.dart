import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/home/home.dart';
import 'package:piyush_flutter_bloc/profile/view/profile_page.dart';
import 'package:piyush_flutter_bloc/tabs/bloc/bottom_navigation_bloc.dart';


class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FirstPageLoaded) {
            return HomePage();
          }
          if (state is SecondPageLoaded) {
            return ProfilePage();
          }
          return Container();
        },
      ),
      bottomNavigationBar:
      BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (BuildContext context, BottomNavigationState state) {
            return BottomNavigationBar(
              currentIndex:
              context.select((BottomNavigationBloc bloc) => bloc.currentIndex),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.black),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded, color: Colors.black),
                  label: 'Profile',
                ),
              ],
              onTap: (index) => context
                  .read<BottomNavigationBloc>()
                  .add(PageTapped(index: index)),
            );
          }),
    );
  }
}