import 'package:personal_proyects/features/sqflite/domain/models/product_model.dart';
import 'package:personal_proyects/features/sqflite/domain/repository/product_repository.dart';

class GetAllByCategoryUsecase {
  final ProductRepository productRepository;

  GetAllByCategoryUsecase({required this.productRepository});

  Future<List<ProductModel>> getAllByCategory(int id) async {
    return await productRepository.getAllByCategory(id);
  }
}
