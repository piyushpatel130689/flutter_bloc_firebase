import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/tabs/bloc/bottom_navigation_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:piyush_flutter_bloc/lib.dart';

class NavigationPage extends StatelessWidget {
  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository(
      apiClient: ApiClient(httpClient: http.Client()),
    );

    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FirstPageLoaded) {
            return HomePage(userRepository: userRepository);
          }
          if (state is SecondPageLoaded) {
            return ProfilePage();
          }

          // return Stack(
          //   children: [
          //     _buildOffstageNavigator(
          //         context,
          //         0,
          //         context.read<BottomNavigationBloc>().currentIndex,
          //         userRepository),
          //     _buildOffstageNavigator(
          //         context,
          //         1,
          //         context.read<BottomNavigationBloc>().currentIndex,
          //         userRepository),
          //   ],
          // );
          return Container();
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (BuildContext context, BottomNavigationState state) {
        return FancyBottomNavigation(
            tabs: [
              TabData(iconData: Icons.home, title: "Home"),
              TabData(iconData: Icons.person, title: "Profile"),
              // TabData(iconData: Icons.shopping_cart, title: "Basket")
            ],
            onTabChangedListener: (position) {
              context
                  .read<BottomNavigationBloc>()
                  .add(PageTapped(index: position));
            });
      }), // bottomNavigationBar:
      //     BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      //         builder: (BuildContext context, BottomNavigationState state) {
      //   return BottomNavigationBar(
      //     currentIndex:
      //         context.select((BottomNavigationBloc bloc) => bloc.currentIndex),
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home, color: Colors.black),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle_rounded, color: Colors.black),
      //         label: 'Profile',
      //       ),
      //     ],
      //     onTap: (index) => context
      //         .read<BottomNavigationBloc>()
      //         .add(PageTapped(index: index)),
      //   );
      // }),
    );
  }

  // Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index,UserRepository userRepository) {
  //   return {
  //     '/': (context) {
  //       return [
  //         HomePage(userRepository: userRepository),
  //         ProfilePage(),
  //       ].elementAt(index);
  //     },
  //   };
  // }

  void _next(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BeerPage()));
  }

  Map<String, WidgetBuilder> _routeBuilders(
      BuildContext context, int index, UserRepository userRepository) {
    return {
      '/': (context) {
        return [
          HomePage(
            userRepository: userRepository,
            onNext: _next,
          ),
          ProfilePage(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(BuildContext context, int index,
      int _selectedIndex, UserRepository userRepository) {
    var routeBuilders = _routeBuilders(context, index, userRepository);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            //builder: (context) => routeBuilders[routeSettings.name](context),
            builder: (context) => [
              HomePage(
                userRepository: userRepository,
                onNext: _next,
              ),
              ProfilePage(),
            ].elementAt(index),
          );
        },
      ),
    );
  }
}
