import 'package:personal_proyects/features/objectbox/domain/models/product_model.dart';
import 'package:personal_proyects/features/objectbox/domain/repository/product_repository.dart';

class InserProductUseCase {
  final ProductRepository productRepository;

  InserProductUseCase({required this.productRepository});

  Future<void> insertProductUsecase(ProductModel productModel) async {
    productRepository.insertProduct(productModel);
  }
}
