import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/products/form_products_provider/form_products_provider.dart';

import '../../../providers/products/form_products_provider/image_provider.dart';

class ImageSection extends ConsumerStatefulWidget {
  const ImageSection({
    super.key,
  });

  @override
  ImageSectionState createState() => ImageSectionState();
}

class ImageSectionState extends ConsumerState<ImageSection> {
  @override
  Widget build(BuildContext context) {
    final imageProvide = ref.watch(selectImageProvider);
    final formProductNotifier = ref.read(formProductProvider.notifier);
    if (imageProvide.path.isNotEmpty) {
      formProductNotifier.setImage(imageProvide.path);
      formProductNotifier.formIsValid();
    } else {
      formProductNotifier.formIsValid();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FittedBox(
        child: SizedBox(
          height: 200,
          width: 200,
          child: imageProvide.path != ""
              ? Image.file(
                  imageProvide,
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
