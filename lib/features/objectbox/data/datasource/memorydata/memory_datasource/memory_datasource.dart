import 'package:personal_proyects/features/objectbox/data/datasource/memorydata/entites/product_entity.dart';

import '../provider_datasource/provider_datarsource.dart';

class ProductMemoryDatasource {
  Future<List<ProductEntity>> getAllProducts() async {
    return listProduct;
  }

  Future<void> insertProduct(ProductEntity productEntity) async {
    listProduct.add(productEntity);
  }
}
