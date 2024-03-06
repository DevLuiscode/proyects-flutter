import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:iconsax/iconsax.dart';
import 'package:personal_proyects/features/objectbox/domain/models/product_model.dart';
import 'package:personal_proyects/features/objectbox/ui/providers/products/product_provider.dart';
import 'package:personal_proyects/features/objectbox/ui/screens/home/sections/sections.dart';

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
          onPressed: () {},
          icon: const Icon(Iconsax.shop),
        )
      ],
    );
  }
}

class SearchProducts extends SearchDelegate<ProductModel?> {
  final ProductNotifier searchProductProvider;

  SearchProducts(
      {super.searchFieldLabel,
      super.searchFieldStyle,
      super.searchFieldDecorationTheme,
      super.keyboardType,
      super.textInputAction,
      required this.searchProductProvider});
  @override
  String get searchFieldLabel => "Buscar producto";
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Iconsax.close_circle4),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        return close(context, null);
      },
      icon: const Icon(Iconsax.arrow_left_2),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: searchProductProvider.searchProducts(query),
      builder: ((context, snapshot) {
        final products = snapshot.data ?? [];
        return GridListWidget(listProduct: products);
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchProductProvider.searchProducts(query),
      builder: ((context, snapshot) {
        final products = snapshot.data ?? [];
        return GridListWidget(listProduct: products);
      }),
    );
  }
}
