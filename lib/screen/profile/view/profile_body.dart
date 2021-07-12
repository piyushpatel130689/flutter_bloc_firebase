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
                  ElevatedButtonCustomWidget(
                      text: "Go beer keep Tab",
                      onPressed: () => onButtonPress(context))
                ],
              ),
            )));
  }
}
