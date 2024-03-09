import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/sqflite/domain/models/cateogry_model.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/products/form_products_provider/image_provider.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/products/product_provider.dart';

import '../../../../domain/models/product_model.dart';
import '../../categories/categories_provider.dart';

final formProductProvider =
    StateNotifierProvider<FormProductsNotifier, bool>((ref) {
  final categories = ref.watch(categoriesProvider);
  final imageProvide = ref.read(selectImageProvider.notifier);
  final productProvide = ref.read(productProvider.notifier);
  return FormProductsNotifier(
    categories: categories,
    imageNotifier: imageProvide,
    productNotifier: productProvide,
  );
});

class FormProductsNotifier extends StateNotifier<bool> {
  final List<CategoryModel> categories;
  final ImageNotifier imageNotifier;
  final ProductNotifier productNotifier;

  FormProductsNotifier({
    required this.categories,
    required this.imageNotifier,
    required this.productNotifier,
  }) : super(false);

  final TextEditingController nameController = TextEditingController(text: "");
  final descriptionController = TextEditingController(text: "");
  final priceHigherController = TextEditingController(text: "");
  final priceUnitController = TextEditingController(text: "");

  int? idSelect;
  String? imageSelect;
  List<DropdownMenuItem> getListDropDownItem() {
    final itemsDropdown = categories
        .where((category) =>
            category.name != "Agregar" && category.name != "Todos")
        .map((category) {
      return DropdownMenuItem(
        value: category.id,
        child: Text(category.name),
      );
    }).toList();
    return itemsDropdown;
  }

  void isRegisterProduct() {
    final productModel = ProductModel(
      name: nameController.text,
      description: descriptionController.text,
      priceHigher: double.parse(priceHigherController.text),
      pridceUnit: double.parse(priceUnitController.text),
      image: imageSelect,
      idCategory: idSelect,
    );

    nameController.clear();
    descriptionController.clear();
    priceHigherController.clear();
    priceUnitController.clear();

    productNotifier.insertProduct(productModel);

    imageNotifier.resetImageState();
    imageSelect = null;
    idSelect = null;
    state = false;
  }

  void formIsValid() {
    state = isValidDropDownItem() &&
        isValidName() &&
        isValidDescription() &&
        isValidPriceHigher() &&
        isValidPriceUnit() &&
        isValidImage();
    //isValidPathImage();
  }

  void setId(int id) {
    idSelect = id;
  }

  void setImage(String path) {
    imageSelect = path;
  }

  bool isValidDropDownItem() {
    return idSelect != null;
  }

  bool isValidName() => nameController.text.isNotEmpty;
  bool isValidDescription() => descriptionController.text.isNotEmpty;
  bool isValidPriceHigher() => priceHigherController.text.isNotEmpty;
  bool isValidPriceUnit() => priceUnitController.text.isNotEmpty;
  bool isValidImage() => imageNotifier.state.path.isNotEmpty;
}
