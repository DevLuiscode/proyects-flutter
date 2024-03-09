import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/sqflite/domain/models/cateogry_model.dart';
import 'package:personal_proyects/features/sqflite/domain/use_cases/categories/add_category_usecase.dart';
import 'package:personal_proyects/features/sqflite/domain/use_cases/categories/getall_category_usecase.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/categories/use_case_provider.dart';

final categoriesProvider =
    StateNotifierProvider<CatogriesNotifier, List<CategoryModel>>(
  (ref) {
    final getAllCategoryUsecase = ref.watch(getAllCategoriesUsecaseProvider);
    final addAllCategoryUsecase = ref.watch(addCategoryUsecaseProvider);
    return CatogriesNotifier(
        getAllUsecase: getAllCategoryUsecase,
        addCateogryUsecase: addAllCategoryUsecase);
  },
);

class CatogriesNotifier extends StateNotifier<List<CategoryModel>> {
  final GetAllUsecase getAllUsecase;
  final AddCateogryUsecase addCateogryUsecase;
  CatogriesNotifier({
    required this.getAllUsecase,
    required this.addCateogryUsecase,
  }) : super([]);

  void insertFirtsCategory() async {
    final categories = await getAllUsecase.getAllCategories();
    bool containsTotal =
        categories.any((category) => category.name.toLowerCase() == 'todos');
    bool containsAdd =
        categories.any((element) => element.name.toLowerCase() == 'Agregar');
    if (!containsTotal && !containsAdd) {
      final add = CategoryModel(name: "Agregar");
      await addCategory(add);
      final category = CategoryModel(name: "Todos");
      await addCategory(category); // Asegúrate de que esta operación es await

      final updatedCategories = await getAllUsecase
          .getAllCategories(); // Vuelve a obtener la lista actualizada
      state = updatedCategories; // Actualiza el estado con la lista actualizada
    } else {
      state =
          categories; // Si "Todos" ya existe, simplemente actualiza el estado con las categorías existentes
    }
  }

  void getAllCategories() async {
    final categories = await getAllUsecase.getAllCategories();
    state = [...categories];
  }

  Future<bool> addCategory(CategoryModel categoryModel) async {
    final categories = await getAllUsecase.getAllCategories();
    final isAdd =
        categories.any((category) => category.name == categoryModel.name);
    if (isAdd) {
      return false;
    }
    {
      await addCateogryUsecase.addCategory(categoryModel);
      getAllCategories();
      return true;
    }
  }
}
