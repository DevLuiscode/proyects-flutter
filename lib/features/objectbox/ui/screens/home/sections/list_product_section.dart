import 'package:flutter/material.dart';

import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:personal_proyects/features/objectbox/data/datasource/localdata/database/dao/product_dao.dart';
import 'package:personal_proyects/features/objectbox/domain/models/product_model.dart';

import 'package:personal_proyects/features/objectbox/ui/providers/products/product_provider.dart';

class ListProductSection extends ConsumerStatefulWidget {
  const ListProductSection({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  ListProductSectionState createState() => ListProductSectionState();
}

class ListProductSectionState extends ConsumerState<ListProductSection> {
  final dao = ProductDao();
  @override
  void initState() {
    ref.read(productProvider.notifier).loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productNotifier = ref.read(productProvider.notifier);
    final listProduct = ref.watch(productProvider);
    return Expanded(
      child: listProduct.isEmpty
          ? const Center(
              child: Text("No hay productos"),
            )
          : RefreshIndicator(
              onRefresh: () async {
                productNotifier.loadData();
              },
              child: GridListWidget(listProduct: listProduct),
            ),
    );
  }
}

class GridListWidget extends StatelessWidget {
  const GridListWidget({
    super.key,
    required this.listProduct,
  });

  final List<ProductModel> listProduct;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: listProduct.length,
      itemBuilder: (context, index) {
        final item = listProduct[index];
        return Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                item.image!.isNotEmpty
                    ? Image.file(
                        File(item.image!),
                        fit: BoxFit.cover,
                      )
                    : Image.asset("assets/noimage.jpg"),
                Container(
                  height: 20,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.shop_add,
                        ),
                      ),
                      Text(
                        item.name,
                        style: textTheme.labelLarge!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
