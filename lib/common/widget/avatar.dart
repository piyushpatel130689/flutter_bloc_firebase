import 'dart:io';
import 'package:flutter/material.dart';
import 'package:piyush_flutter_bloc/common/sizeconfig.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.photo, this.imageSize})
      : super(key: key);

  final String photo;
  final double? imageSize;

  @override
  Widget build(BuildContext context) {
    final photo = this.photo;
    bool _validURL = Uri.parse(photo).isAbsolute;
    // return CircleAvatar(
    //   radius: _avatarSize,
    //   backgroundImage: photo != null ? NetworkImage(photo) : null,
    //   child: photo == null
    //       ? const Icon(Icons.person_outline, size: _avatarSize)
    //       : null,
    // );
    return Container(
      height: imageSize ?? SizeConfig.profilepicHeightWidth,
      width: imageSize ?? SizeConfig.profilepicHeightWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: _validURL
            ? Image.network(
                photo,
                fit: BoxFit.cover,
              )
            : (photo.isNotEmpty
                ? Image.file(
                    File(photo),
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/user.png',
                    // height: SizeConfig.profilepicHeightWidth,
                  )),
      ),
    );
  }
}
