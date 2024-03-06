import 'package:personal_proyects/features/objectbox/domain/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getAllProducts();
  Future<void> insertProduct(ProductModel productModel);
  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> searchProduct(String query);
}
