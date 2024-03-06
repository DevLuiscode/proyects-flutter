import 'package:personal_proyects/features/objectbox/data/datasource/localdata/database/database_helper.dart';
import 'package:personal_proyects/features/objectbox/data/datasource/localdata/entities/category_entity_local.dart';
import 'package:sqflite/sqflite.dart';

class CategoryDao {
  final database = DatabaseHelper.instance.db;

  Future<List<CategoryEntityLocal>> getAllCategories() async {
    final data = await database.query("category");

    return data.map((category) {
      return CategoryEntityLocal.fromMap(category);
    }).toList();
  }

  Future<void> insertCategory(CategoryEntityLocal categoryEntityLocal) async {
    int id = await database.insert(
      "category",
      categoryEntityLocal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    database.insert(
      "category",
      {
        "id": id,
        'name': categoryEntityLocal.name,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
