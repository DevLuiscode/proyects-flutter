import 'package:personal_proyects/features/objectbox/data/datasource/localdata/database/database_helper.dart';
import 'package:personal_proyects/features/objectbox/data/datasource/localdata/entities/product_entity_local.dart';

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
        'image': productEntityLocal.image
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
}
