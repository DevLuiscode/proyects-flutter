import 'package:personal_proyects/features/objectbox/domain/models/cateogry_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getAllCategories();
  Future<void> addCategory(CategoryModel categoryModel);
}
