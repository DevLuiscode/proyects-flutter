import 'package:personal_proyects/features/objectbox/domain/models/product_model.dart';
import 'package:personal_proyects/features/objectbox/domain/repository/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository productRepository;

  GetProductsUseCase({required this.productRepository});

  Future<List<ProductModel>> getAllProductsUseCase() {
    return productRepository.getAllProducts();
  }
}
