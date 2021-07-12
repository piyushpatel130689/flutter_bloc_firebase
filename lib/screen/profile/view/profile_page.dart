import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/lib.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: ProfilePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: MyStyles.fontScreenTitleTextBold(),
        ),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(SizeConfig.screenPadding),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ProfileBloc>(
                create: (BuildContext context) => ProfileBloc()),
            BlocProvider<ThemeBloc>(
                create: (BuildContext context) => ThemeBloc())
          ],
          child: ProfileBody(
            textTheme: textTheme,
            user: user,
          ),
        ),
      ),
    );
  }
}
