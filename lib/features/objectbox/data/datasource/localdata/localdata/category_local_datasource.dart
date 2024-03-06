import 'package:personal_proyects/features/objectbox/data/datasource/localdata/database/dao/category_dao.dart';
import 'package:personal_proyects/features/objectbox/data/datasource/localdata/entities/category_entity_local.dart';

class CategoryLocalDatasource {
  final categoryDao = CategoryDao();

  Future<List<CategoryEntityLocal>> getAllCategories() async {
    return categoryDao.getAllCategories();
  }

  Future<void> insertCategory(CategoryEntityLocal categoryEntityLocal) async {
    await categoryDao.insertCategory(categoryEntityLocal);
  }
}
