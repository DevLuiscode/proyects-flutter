import 'package:personal_proyects/features/sqflite/domain/models/card_model.dart';
import 'package:personal_proyects/features/sqflite/domain/models/product_model.dart';

abstract class CardRepository {
  Future<List<CardModel>> getAllCard();
  Future<void> inserCard(ProductModel productModel);
  void deleteCard(String name);
  void incrementeAmount(int index);
  void decrementeAmount(int index);
  void decrementePrice(int index);
  void increcrementePrice(int index);
  void priceTotalItem(int index);
  double total();
}
