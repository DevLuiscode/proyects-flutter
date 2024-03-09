import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final selectImageProvider = StateNotifierProvider<ImageNotifier, File>((ref) {
  return ImageNotifier();
});

class ImageNotifier extends StateNotifier<File> {
  ImageNotifier() : super(File(""));

  Future imageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      state = File(image.path);
    } else {
      resetImageState();
    }
  }

  Future imageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      state = File(image.path);
    } else {
      resetImageState();
    }
  }

  void resetImageState() {
    state = File("");
  }
}
