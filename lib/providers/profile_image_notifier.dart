
import 'dart:typed_data';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfileImageNotifier extends ChangeNotifier
{
  File? imageFile;

  void setImage(Uint8List image) async
  {
    File file = File('${(await getApplicationDocumentsDirectory()).path}/profile.png');
    file.writeAsBytesSync(image);
    imageFile = file;
    notifyListeners();
  }

  Future<void> loadImage() async
  {
    final selectedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if(selectedImage == null) {
      return;
    }
    imageFile = File(selectedImage.path);
    notifyListeners();
  }
}