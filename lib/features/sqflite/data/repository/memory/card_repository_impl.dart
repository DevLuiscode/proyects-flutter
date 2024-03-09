import 'package:personal_proyects/features/sqflite/data/datasource/memorydata/memory_datasource/card_memory_datasource.dart';
import 'package:personal_proyects/features/sqflite/domain/models/card_model.dart';
import 'package:personal_proyects/features/sqflite/domain/models/product_model.dart';
import 'package:personal_proyects/features/sqflite/domain/repository/card_repository.dart';
import 'package:personal_proyects/features/sqflite/mappers/memory/card_mapper.dart';

class CardMemoryRepositoryImple extends CardRepository {
  final CardMemoryDataSource cardMemoryDataSource;

  CardMemoryRepositoryImple({required this.cardMemoryDataSource});
  @override
  Future<List<CardModel>> getAllCard() async {
    return cardMemoryDataSource.getAllCard();
  }

  @override
  Future<void> inserCard(ProductModel productModel) async {
    final data = CardMapper.mapProductToCard(productModel);
    cardMemoryDataSource.insertCardMode(data);
  }

  @override
  void deleteCard(String name) {
    cardMemoryDataSource.deleteCard(name);
  }

  @override
  void incrementeAmount(int index) {
    cardMemoryDataSource.incrementeAmount(index);
  }

  @override
  void decrementeAmount(int index) {
    cardMemoryDataSource.decrementeAmount(index);
  }

  @override
  void decrementePrice(int index) {
    cardMemoryDataSource.decrementePrice(index);
  }

  @override
  void priceTotalItem(int index) {
    cardMemoryDataSource.priceTotal(index);
  }

  @override
  void increcrementePrice(int index) {
    cardMemoryDataSource.increcrementePrice(index);
  }

  @override
  double total() {
    return cardMemoryDataSource.totalPriceAll();
  }
}
