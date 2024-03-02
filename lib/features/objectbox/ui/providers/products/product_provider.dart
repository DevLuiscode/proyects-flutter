import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/objectbox/data/datasource/localdata/database/dao.dart';
import 'package:personal_proyects/features/objectbox/domain/models/product_model.dart';
import 'package:personal_proyects/features/objectbox/domain/use_cases/products/get_products_usecase.dart';
import 'package:personal_proyects/features/objectbox/domain/use_cases/products/insert_product_usecase.dart';
import 'package:personal_proyects/features/objectbox/mappers/local/product_local_mapper.dart';
import 'package:personal_proyects/features/objectbox/ui/providers/products/usecase_provider.dart';

final productProvider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  final getProductsUseCase = ref.watch(getAllUseCaseProvider);
  final inserProductUseCase = ref.watch(insertProductUseCaseProvider);
  return ProductNotifier(
    getProductsUseCase: getProductsUseCase,
    inserProductUseCase: inserProductUseCase,
  );
});

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  final GetProductsUseCase getProductsUseCase;
  final InserProductUseCase inserProductUseCase;

  ProductNotifier(
      {required this.getProductsUseCase, required this.inserProductUseCase})
      : super([]);

  void loadData() async {
    final products = await getProductsUseCase.getAllProductsUseCase();
    state = [...products];
  }

  void insertProduct(ProductModel productModel) async {
    inserProductUseCase.insertProductUsecase(productModel);
  }
}
