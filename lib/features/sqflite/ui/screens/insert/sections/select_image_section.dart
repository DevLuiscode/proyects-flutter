import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../providers/products/form_products_provider/image_provider.dart';

class SelectImageSection extends ConsumerStatefulWidget {
  const SelectImageSection({
    super.key,
  });

  @override
  SelectImageSectionState createState() => SelectImageSectionState();
}

class SelectImageSectionState extends ConsumerState<SelectImageSection> {
  @override
  Widget build(BuildContext context) {
    final imageNotifier = ref.read(selectImageProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 30,
          onPressed: () async {
            imageNotifier.imageFromGallery();
          },
          icon: const Icon(
            Iconsax.gallery,
          ),
        ),
        IconButton(
          iconSize: 30,
          onPressed: () async {
            imageNotifier.imageFromCamera();
          },
          icon: const Icon(
            Iconsax.camera,
          ),
        ),
      ],
    );
  }
}
