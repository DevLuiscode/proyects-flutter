import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:personal_proyects/features/sqflite/domain/models/product_model.dart';
import 'package:personal_proyects/features/sqflite/ui/screens/home/sections/list_product_section.dart';

import '../../providers/products/product_provider.dart';

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
