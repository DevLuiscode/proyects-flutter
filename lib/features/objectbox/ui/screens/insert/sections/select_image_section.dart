import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageSection extends StatefulWidget {
  final File? selectImage;
  final Function(File?) onImageSelected;
  const SelectImageSection({
    super.key,
    required this.selectImage,
    required this.onImageSelected,
  });

  @override
  State<SelectImageSection> createState() => _SelectImageSectionState();
}

class _SelectImageSectionState extends State<SelectImageSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 30,
          onPressed: () async {
            imageFromGallery();
          },
          icon: const Icon(
            Iconsax.gallery,
          ),
        ),
        IconButton(
          iconSize: 30,
          onPressed: () async {
            imageFromCamera();
          },
          icon: const Icon(
            Iconsax.camera,
          ),
        ),
      ],
    );
  }

  Future imageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      //widget.selectImage = File(image!.path);
      widget.onImageSelected(File(image!.path));
    });
  }

  Future imageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        // Notifica al widget padre sobre la nueva imagen seleccionada
        widget.onImageSelected(File(image.path));
      });
    }
  }
}
