import 'package:personal_proyects/features/objectbox/data/datasource/localdata/localdata/local_datasource.dart';
import 'package:personal_proyects/features/objectbox/domain/models/product_model.dart';
import 'package:personal_proyects/features/objectbox/domain/repository/product_repository.dart';
import 'package:personal_proyects/features/objectbox/mappers/local/product_local_mapper.dart';

class ProductRepositoryLocalImplementation implements ProductRepository {
  final ProductLocalDataSource productLocalDataSource;

  ProductRepositoryLocalImplementation({required this.productLocalDataSource});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await productLocalDataSource.getAllProducts();
    return response.map((product) {
      return ProductLocalMapper.mapEntityToModel(product);
    }).toList();
  }

  @override
  Future<void> insertProduct(ProductModel productModel) async {
    await productLocalDataSource
        .insertProduct(ProductLocalMapper.mapModelToEntity(productModel));
  }
}
