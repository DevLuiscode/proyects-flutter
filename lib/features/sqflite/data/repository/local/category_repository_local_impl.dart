import 'package:personal_proyects/features/sqflite/data/datasource/localdata/localdata/category_local_datasource.dart';
import 'package:personal_proyects/features/sqflite/domain/models/cateogry_model.dart';
import 'package:personal_proyects/features/sqflite/domain/repository/category_repository.dart';
import 'package:personal_proyects/features/sqflite/mappers/local/category_local_mapper.dart';

class CategoryRepositoryLocalImpl extends CategoryRepository {
  final CategoryLocalDatasource categoryLocalDatasource;

  CategoryRepositoryLocalImpl({required this.categoryLocalDatasource});

  @override
  Future<void> addCategory(CategoryModel categoryModel) async {
    final dataMap = CategoryLocalMapper.mapModelToEntity(categoryModel);
    categoryLocalDatasource.insertCategory(dataMap);
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final data = await categoryLocalDatasource.getAllCategories();
    return data.map((category) {
      return CategoryLocalMapper.mapEntityToModel(category);
    }).toList();
  }
}
