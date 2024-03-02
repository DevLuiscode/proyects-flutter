import 'dart:io';

import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final File? image;
  const ImageSection({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FittedBox(
        child: SizedBox(
          height: 200,
          width: 200,
          child: image != null
              ? Image.file(
                  image!,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/noimage.jpg',
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
