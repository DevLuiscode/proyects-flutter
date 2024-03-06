import 'package:personal_proyects/features/objectbox/data/datasource/localdata/database/dao/product_dao.dart';
import 'package:personal_proyects/features/objectbox/data/datasource/localdata/entities/product_entity_local.dart';

class ProductLocalDataSource {
  final dao = ProductDao();

  Future<List<ProductEntityLocal>> getAllProducts() async {
    return dao.getAll();
  }

  Future<void> insertProduct(ProductEntityLocal productEntityLocal) async {
    dao.insertProduct(productEntityLocal);
  }

  Future<List<ProductEntityLocal>> getAllByCategory(int id) async {
    return dao.getAllByCategory(id);
  }

  Future<List<ProductEntityLocal>> searchProduct(String query) async {
    return dao.searProduct(query);
  }
}
