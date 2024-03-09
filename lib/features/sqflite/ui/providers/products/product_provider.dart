import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/sqflite/domain/models/product_model.dart';
import 'package:personal_proyects/features/sqflite/domain/use_cases/products/get_products_by_category_usecase.dart';
import 'package:personal_proyects/features/sqflite/domain/use_cases/products/get_products_usecase.dart';
import 'package:personal_proyects/features/sqflite/domain/use_cases/products/insert_product_usecase.dart';
import 'package:personal_proyects/features/sqflite/domain/use_cases/products/search_product_usecase.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/products/usecase_provider.dart';

final productProvider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  final getProductsUseCase = ref.watch(getAllUseCaseProvider);
  final inserProductUseCase = ref.watch(insertProductUseCaseProvider);
  final getAllByCategoryUseCase = ref.watch(getAllByCategoryUsecaseProvider);
  final searchProducUsecase = ref.watch(searchProducUsecaseProvider);
  return ProductNotifier(
    getProductsUseCase: getProductsUseCase,
    inserProductUseCase: inserProductUseCase,
    getAllByCategoryUsecase: getAllByCategoryUseCase,
    searProductUsecase: searchProducUsecase,
  );
});

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  final GetProductsUseCase getProductsUseCase;
  final InserProductUseCase inserProductUseCase;
  final GetAllByCategoryUsecase getAllByCategoryUsecase;
  final SearProductUsecase searProductUsecase;
  ProductNotifier({
    required this.getProductsUseCase,
    required this.inserProductUseCase,
    required this.getAllByCategoryUsecase,
    required this.searProductUsecase,
  }) : super([]);

  void loadData() async {
    final products = await getProductsUseCase.getAllProductsUseCase();
    state = [...products];
  }

  void insertProduct(ProductModel productModel) async {
    inserProductUseCase.insertProductUsecase(productModel);
  }

  void getAllByCategory(int id) async {
    if (id > 2) {
      final products = await getAllByCategoryUsecase.getAllByCategory(id);
      state = [...products];
    } else {
      loadData();
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    return await searProductUsecase.searchProduch(query);
  }
}
