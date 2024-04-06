
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:braucoe/providers/profile_image_notifier.dart';
import 'package:braucoe/widgets/profile_image_item.dart';

class ProfileImageGenerator extends StatelessWidget {
  ProfileImageGenerator({required this.radius, super.key});

  double radius;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileImageNotifier>(
        builder: (ctx, profileImageNotifier, child) {
      return ProfileImageItem(
        profileImageNotifier: profileImageNotifier,
        radius: radius,
        image: MemoryImage(
          profileImageNotifier.imageFile!.readAsBytesSync(),
        ),
      );
    });
  }
}
