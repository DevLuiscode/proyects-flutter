import 'package:personal_proyects/features/sqflite/data/datasource/localdata/entities/category_entity_local.dart';
import 'package:personal_proyects/features/sqflite/domain/models/cateogry_model.dart';

class CategoryLocalMapper {
  static CategoryModel mapEntityToModel(
      CategoryEntityLocal categoryEntityLocal) {
    return CategoryModel(
      id: categoryEntityLocal.id,
      name: categoryEntityLocal.name,
    );
  }

  static CategoryEntityLocal mapModelToEntity(CategoryModel categoryModel) {
    return CategoryEntityLocal(
      name: categoryModel.name,
    );
  }
}
