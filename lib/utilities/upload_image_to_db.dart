
import 'package:braucoe/providers/profile_image_notifier.dart';

import '../data/apis/image_api.dart';

void uploadImage(int studentId, ProfileImageNotifier profileImageNotifier) async {
  await profileImageNotifier.loadImage();
  ImageAPI imageAPI = ImageAPI();
  imageAPI.uploadImage(studentId, profileImageNotifier.imageFile);
}