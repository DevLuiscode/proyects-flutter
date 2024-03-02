import 'package:personal_proyects/features/objectbox/data/datasource/localdata/database/dao.dart';
import 'package:personal_proyects/features/objectbox/data/datasource/localdata/entities/product_entity_local.dart';

class ProductLocalDataSource {
  final dao = ProductDao();

  Future<List<ProductEntityLocal>> getAllProducts() async {
    return dao.getAll();
  }

  Future<void> insertProduct(ProductEntityLocal productEntityLocal) async {
    dao.insertProduct(productEntityLocal);
  }
}
