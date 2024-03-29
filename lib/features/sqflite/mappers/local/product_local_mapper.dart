import 'package:personal_proyects/features/sqflite/data/datasource/localdata/entities/product_entity_local.dart';
import 'package:personal_proyects/features/sqflite/domain/models/product_model.dart';

class ProductLocalMapper {
  static ProductEntityLocal mapModelToEntity(ProductModel productModel) {
    return ProductEntityLocal(
      name: productModel.name,
      description: productModel.description,
      priceHigher: productModel.priceHigher,
      priceUnit: productModel.pridceUnit,
      image: productModel.image!,
      idCategory: productModel.idCategory!,
    );
  }

  static ProductModel mapEntityToModel(ProductEntityLocal productEntityLocal) {
    return ProductModel(
      name: productEntityLocal.name,
      description: productEntityLocal.description,
      priceHigher: productEntityLocal.priceHigher,
      pridceUnit: productEntityLocal.priceUnit,
      image: productEntityLocal.image,
      idCategory: productEntityLocal.idCategory,
    );
  }
}
