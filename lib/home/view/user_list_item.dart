import 'package:flutter/material.dart';
import 'package:piyush_flutter_bloc/common/common.dart';
import 'package:piyush_flutter_bloc/common/mystyles.dart';
import 'package:piyush_flutter_bloc/common/sizeconfig.dart';
import 'package:piyush_flutter_bloc/data/models/models.dart';

class UserListItem extends StatelessWidget {
  final UserModel user;

  const UserListItem(this.user);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        user.avatarUrl == null
            ? Container()
            : Avatar(
                photo: user.avatarUrl.toString(),
                imageSize: 50,
              ),
        SizedBox(
          width: SizeConfig.verticalSizeBoxSpace,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.login.toString(),
              style: MyStyles.fontMediumTextBold(),
            ),
            Text(
              user.type.toString(),
              style: MyStyles.fontMediumText(),
            ),
          ],
        ))
      ],
    );
  }
}
