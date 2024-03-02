import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:personal_proyects/features/objectbox/data/datasource/localdata/database/dao.dart';
import 'package:personal_proyects/features/objectbox/domain/models/product_model.dart';
import 'package:personal_proyects/features/objectbox/mappers/local/product_local_mapper.dart';

import 'package:personal_proyects/features/objectbox/ui/providers/products/product_provider.dart';

class ListProductSection extends ConsumerStatefulWidget {
  const ListProductSection({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  _ListProductSectionState createState() => _ListProductSectionState();
}

class _ListProductSectionState extends ConsumerState<ListProductSection> {
  List<ProductModel> products = [];
  final dao = ProductDao();
  @override
  void initState() {
    ref.read(productProvider.notifier).loadData();
    // dao.getAll().then((value) {
    //   setState(() {
    //     products = value.map((e) {
    //       return ProductLocalMapper.mapEntityToModel(e);
    //     }).toList();
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listProduct = ref.watch(productProvider);
    return Expanded(
      child: listProduct.isEmpty
          ? const Center(
              child: Text("No hay productos"),
            )
          : GridView.builder(
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
                        item.image.isNotEmpty
                            ? Image.file(
                                File(item.image),
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
                                style: widget.textTheme.labelLarge!.copyWith(
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
            ),
    );
  }
}
