import 'package:personal_proyects/features/sqflite/data/datasource/memorydata/memory_datasource/memory_datasource.dart';
import 'package:personal_proyects/features/sqflite/domain/models/product_model.dart';
import 'package:personal_proyects/features/sqflite/domain/repository/product_repository.dart';
import 'package:personal_proyects/features/sqflite/mappers/memory/product_mapper.dart';

class ProductRepositoryImplementation extends ProductRepository {
  final ProductMemoryDatasource productMemoryDatasource;

  ProductRepositoryImplementation({
    required this.productMemoryDatasource,
  });
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await productMemoryDatasource.getAllProducts();
    final productMap = response.map((entity) {
      return ProductMapper.mapEntityToModel(entity);
    }).toList();

    return productMap;
  }

  @override
  Future<void> insertProduct(ProductModel productModel) async {
    final productEntity = ProductMapper.mapModelToEntity(productModel);
    productMemoryDatasource.insertProduct(productEntity);
  }

  @override
  Future<List<ProductModel>> getAllByCategory(int id) {
    // TODO: implement getAllByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> searchProduct(String query) {
    // TODO: implement searchProduct
    throw UnimplementedError();
  }
}
