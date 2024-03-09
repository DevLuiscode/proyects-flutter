import 'package:personal_proyects/features/sqflite/data/datasource/localdata/localdata/product_local_datasource.dart';
import 'package:personal_proyects/features/sqflite/domain/models/product_model.dart';
import 'package:personal_proyects/features/sqflite/domain/repository/product_repository.dart';
import 'package:personal_proyects/features/sqflite/mappers/local/product_local_mapper.dart';

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

  @override
  Future<List<ProductModel>> getAllByCategory(int id) async {
    final response = await productLocalDataSource.getAllByCategory(id);
    return response.map((products) {
      return ProductLocalMapper.mapEntityToModel(products);
    }).toList();
  }

  @override
  Future<List<ProductModel>> searchProduct(String query) async {
    final response = await productLocalDataSource.searchProduct(query);

    return response.map((product) {
      return ProductLocalMapper.mapEntityToModel(product);
    }).toList();
  }
}
