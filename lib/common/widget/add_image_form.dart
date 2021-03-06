import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:piyush_flutter_bloc/common/mystyles.dart';

import 'avatar.dart';

class AddImageForm extends StatelessWidget {
  final String imagePath;
  final Function(String) onChanged;

  const AddImageForm({
    required Key key,
    required this.imagePath,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _placeholder = Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(50)),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
            onTap: () => _onAddImage(context),
            child: imagePath == null
                ? _placeholder
                : _ImageWidget(
                    key: const Key('profile_image'),
                    image: imagePath,
                  )),
        SizedBox(
          height: 5,
        ),
        Text(
          'Add Profile Image',
          style: MyStyles.fontRegularText(),
        ),
      ],
    );
  }

  _onAddImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => _showCamera(context),
              child: Text(
                'Add from Camera',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => _showGallery(context),
              child: Text(
                'Add from Library',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showCamera(BuildContext context) {
    Navigator.of(context).pop();
    _showImagePicker(ImageSource.camera);
  }

  _showGallery(BuildContext context) {
    Navigator.of(context).pop();
    _showImagePicker(ImageSource.gallery);
  }

  _showImagePicker(ImageSource imageSource) async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? image =
        await imagePicker.getImage(source: imageSource, imageQuality: 60);
    if (image != null) {
      onChanged(image.path);
    }
  }
}

class _ImageWidget extends StatelessWidget {
  final String image;

  const _ImageWidget({
    required Key key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Avatar(photo: image);
  }
}
