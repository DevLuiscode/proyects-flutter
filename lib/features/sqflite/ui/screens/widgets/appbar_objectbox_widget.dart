import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:iconsax/iconsax.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/navigation/app_navigation.dart';

import 'package:personal_proyects/features/sqflite/ui/providers/products/product_provider.dart';
import 'package:personal_proyects/features/sqflite/ui/screens/card/card_screen.dart';
import 'package:personal_proyects/features/sqflite/ui/screens/delegates/search_product_delegate.dart';

class AppBarObjectBoxWidget extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const AppBarObjectBoxWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  AppBarObjectBoxWidgetState createState() => AppBarObjectBoxWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarObjectBoxWidgetState extends ConsumerState<AppBarObjectBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Bienvendo de vuelta!",
            style: widget.textTheme.labelMedium,
          ),
          Text(
            "Luis Store",
            style: widget.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () async {
            final searchProductProvider = ref.read(productProvider.notifier);
            showSearch(
              context: context,
              delegate:
                  SearchProducts(searchProductProvider: searchProductProvider),
            );
          },
          icon: const Icon(Iconsax.search_normal),
        ),
        IconButton(
          onPressed: () {
            ref
                .read(appNavigationProvider.notifier)
                .setNavigationScreen(CardScreen.name);
          },
          icon: const Icon(Iconsax.shop),
        )
      ],
    );
  }
}
