import 'package:personal_proyects/features/sqflite/domain/models/card_model.dart';
import 'package:personal_proyects/features/sqflite/domain/models/product_model.dart';
import 'package:personal_proyects/features/sqflite/domain/repository/card_repository.dart';

class CardUsecase {
  final CardRepository cardRepository;

  CardUsecase({required this.cardRepository});

  Future<List<CardModel>> getAllCard() async {
    return await cardRepository.getAllCard();
  }

  Future<void> inserCard(ProductModel productModel) async {
    return await cardRepository.inserCard(productModel);
  }

  void deleteCard(String name) {
    cardRepository.deleteCard(name);
  }

  void incrementeAmount(int index) {
    cardRepository.incrementeAmount(index);
  }

  void decrementeAmount(int index) {
    cardRepository.decrementeAmount(index);
  }

  void decrementePrice(int index) {
    cardRepository.decrementePrice(index);
  }

  void priceTotalItem(int index) {
    cardRepository.priceTotalItem(index);
  }

  void increcrementePrice(int index) {
    cardRepository.increcrementePrice(index);
  }

  double total() {
    return cardRepository.total();
  }
}
