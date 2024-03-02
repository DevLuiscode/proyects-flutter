import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppBarObjectBoxWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarObjectBoxWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Bienvendo de vuelta!",
            style: textTheme.labelMedium,
          ),
          Text(
            "Luis Store",
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.shop),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
