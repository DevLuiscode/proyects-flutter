import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/objectbox/ui/providers/categories/categories_provider.dart';
import 'package:personal_proyects/features/objectbox/ui/providers/navigation/category_navigation/category_navigation_provider.dart';
import 'package:personal_proyects/features/objectbox/ui/providers/products/product_provider.dart';

class CategorySection extends ConsumerStatefulWidget {
  const CategorySection({
    super.key,
  });

  @override
  CategorySectionState createState() => CategorySectionState();
}

class CategorySectionState extends ConsumerState<CategorySection> {
  @override
  void initState() {
    ref.read(categoriesProvider.notifier).getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryNavigationNotifier =
        ref.read(categoryNavigationProvider.notifier);
    final categoriesList = ref.watch(categoriesProvider);
    final productsNotifier = ref.read(productProvider.notifier);
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ListView.builder(
          itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          itemExtent: 120,
          itemBuilder: (context, index) {
            final item = categoriesList[index];
            return InkWell(
              onTap: () {
                categoryNavigationNotifier.setNavigation(item.name, context);
                productsNotifier.getAllByCategory(item.id!);
              },
              customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Card(
                color: item.name == "Agregar" ? const Color(0XFF0040D4) : null,
                child: Center(
                  child: Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium!.copyWith(
                      color: item.name == "Agregar" ? Colors.white : null,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
