import 'package:personal_proyects/features/objectbox/data/datasource/memorydata/entites/product_entity.dart';
import 'package:personal_proyects/features/objectbox/domain/models/product_model.dart';

class ProductMapper {
  static ProductModel mapEntityToModel(ProductEntity productEntity) {
    return ProductModel(
      name: productEntity.name,
      description: productEntity.description,
      priceHigher: productEntity.priceHigher,
      pridceUnit: productEntity.priceUnit,
      image: productEntity.image,
    );
  }

  static ProductEntity mapModelToEntity(ProductModel productModel) {
    return ProductEntity(
      name: productModel.name,
      description: productModel.description,
      priceHigher: productModel.priceHigher,
      priceUnit: productModel.pridceUnit,
      image: productModel.image,
    );
  }
}
