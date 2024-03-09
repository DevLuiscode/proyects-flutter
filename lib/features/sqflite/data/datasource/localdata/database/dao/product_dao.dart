import 'package:personal_proyects/features/sqflite/data/datasource/localdata/database/database_helper.dart';
import 'package:personal_proyects/features/sqflite/data/datasource/localdata/entities/product_entity_local.dart';

class ProductDao {
  final database = DatabaseHelper.instance.db;

  Future<List<ProductEntityLocal>> getAll() async {
    final data = await database.query("products");
    return data.map((products) {
      return ProductEntityLocal.fromMap(products);
    }).toList();
  }

  Future<int> insertProduct(ProductEntityLocal productEntityLocal) async {
    return await database.insert(
      "products",
      {
        'name': productEntityLocal.name,
        'description': productEntityLocal.description,
        'priceHigher': productEntityLocal.priceHigher,
        'priceUnit': productEntityLocal.priceUnit,
        'image': productEntityLocal.image,
        'category_id': productEntityLocal.idCategory,
      },
    );
  }

  Future<void> updateProduct(ProductEntityLocal productEntityLocal) async {
    await database.update('products', productEntityLocal.toMap(),
        where: 'id = ?', whereArgs: [productEntityLocal.id]);
  }

  Future<void> deleteProduct(ProductEntityLocal productEntityLocal) async {
    await database.delete('products',
        where: 'id = ?', whereArgs: [productEntityLocal.id]);
  }

  Future<List<ProductEntityLocal>> getAllByCategory(int id) async {
    final dataResponse = await database
        .query("products", where: 'category_id = ?', whereArgs: [id]);
    return dataResponse.map((products) {
      return ProductEntityLocal.fromMap(products);
    }).toList();
  }

  Future<List<ProductEntityLocal>> searProduct(String query) async {
    final pattern = '%$query%';
    final dataResponse = await database.query(
      "products",
      where: "name LIKE ? OR description LIKE ? OR id LIKE ?",
      whereArgs: [pattern, pattern, pattern],
    );
    return dataResponse.map((product) {
      return ProductEntityLocal.fromMap(product);
    }).toList();
  }
}
