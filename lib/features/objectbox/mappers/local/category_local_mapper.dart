import 'package:personal_proyects/features/objectbox/data/datasource/localdata/entities/category_entity_local.dart';
import 'package:personal_proyects/features/objectbox/domain/models/cateogry_model.dart';

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
