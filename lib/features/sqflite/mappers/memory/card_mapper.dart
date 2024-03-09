import 'package:personal_proyects/features/sqflite/domain/models/card_model.dart';
import 'package:personal_proyects/features/sqflite/domain/models/product_model.dart';

class CardMapper {
  static CardModel mapProductToCard(ProductModel productModel) {
    return CardModel(
      name: productModel.name,
      priceHigher: productModel.priceHigher,
      pridceUnit: productModel.pridceUnit,
      image: productModel.image!,
    );
  }
}
