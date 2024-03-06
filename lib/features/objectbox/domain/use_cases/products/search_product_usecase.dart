import 'package:personal_proyects/features/objectbox/domain/models/product_model.dart';
import 'package:personal_proyects/features/objectbox/domain/repository/product_repository.dart';

class SearProductUsecase {
  final ProductRepository productRepository;

  SearProductUsecase({required this.productRepository});

  Future<List<ProductModel>> searchProduch(String query) async {
    return productRepository.searchProduct(query);
  }
}
