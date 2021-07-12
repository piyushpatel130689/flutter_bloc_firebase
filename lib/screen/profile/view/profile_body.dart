import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piyush_flutter_bloc/lib.dart';
import 'package:piyush_flutter_bloc/screen/profile/bloc/profile_bloc.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key, required this.textTheme, required this.user})
      : super(key: key);

  final textTheme;
  final user;

  void onButtonPress(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BeerPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        child: Align(
            alignment: const Alignment(0, -1 / 3),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Avatar(photo: user.photo ?? ''),
                  const SizedBox(height: SizeConfig.verticalSizeBoxSpace),
                  Text(user.email ?? '', style: MyStyles.fontRegularText()),
                  const SizedBox(height: SizeConfig.verticalSizeBoxSpace),
                  Text(user.name ?? '', style: textTheme.headline5),
                  const SizedBox(height: SizeConfig.verticalSizeBoxSpace),
                  _ThemeField(),
                  const SizedBox(height: SizeConfig.verticalSizeBoxSpace),
                  ElevatedButtonCustomWidget(
                      text: "Go beer keep Tab",
                      onPressed: () => onButtonPress(context))
                ],
              ),
            )));
  }
}

class _ThemeField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      // buildWhen: (previous, current) =>
      //     previous.isDarkTheme != current.isDarkTheme,
      builder: (context, state) {
        return LinkedLabelSwitch(
          label: 'Dark mode enabled',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: context.read<ThemeBloc>().isDarkMode,
          onChanged: (bool newValue) {
            MySharePreference().setDarkMode(newValue);
            if (newValue) {
              context
                  .read<ThemeBloc>()
                  .add(ThemeChangeEvent(themeData: ThemeData.dark()));
            } else {
              context
                  .read<ThemeBloc>()
                  .add(ThemeChangeEvent(themeData: ThemeData.light()));
            }
            // MySharePreference().getIsDarkMode().then((resultVal) {
            //   if (resultVal) {
            //     context.read<ThemeBloc>().add(
            //         ThemeChangeEvent(themeData: ThemeData.dark()));
            //   } else {
            //     context.read<ThemeBloc>().add(
            //         ThemeChangeEvent(themeData: ThemeData.light()));
            //   }/**/
            //   print('=======$resultVal');
            // });
          },
        );
      },
    );
  }
}
