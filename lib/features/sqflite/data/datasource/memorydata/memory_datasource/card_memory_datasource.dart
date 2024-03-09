import 'package:personal_proyects/features/sqflite/data/datasource/memorydata/provider_datasource/card_provide_datasource.dart';
import 'package:personal_proyects/features/sqflite/domain/models/card_model.dart';

class CardMemoryDataSource {
  Future<List<CardModel>> getAllCard() async {
    return cardMemoryListDataSource;
  }

  Future<void> insertCardMode(CardModel cardModel) async {
    if (!cardMemoryListDataSource.contains(cardModel)) {
      cardMemoryListDataSource.add(cardModel);
    }
  }

  void deleteCard(String name) {
    final index =
        cardMemoryListDataSource.indexWhere((card) => card.name == name);
    if (index >= 0) {
      cardMemoryListDataSource.removeAt(index);
    }
  }

  void incrementeAmount(int index) {
    int currentAmount = cardMemoryListDataSource[index].amount!;
    cardMemoryListDataSource[index] = cardMemoryListDataSource[index].copyWith(
      amount: currentAmount + 1,
    );
  }

  void decrementeAmount(int index) {
    int currentAmount = cardMemoryListDataSource[index].amount!;
    if (currentAmount > 0) {
      cardMemoryListDataSource[index] =
          cardMemoryListDataSource[index].copyWith(
        amount: currentAmount - 1,
      );
    }
  }

  void decrementePrice(int index) {
    int currentAmount = cardMemoryListDataSource[index].amount!;
    double currentPriceHigher = cardMemoryListDataSource[index].priceHigher;
    double currentPriceUnit = cardMemoryListDataSource[index].pridceUnit;
    if (currentAmount >= 3) {
      cardMemoryListDataSource[index] =
          cardMemoryListDataSource[index].copyWith(
        priceHigher: currentPriceHigher - 1,
      );
    } else {
      cardMemoryListDataSource[index] =
          cardMemoryListDataSource[index].copyWith(
        pridceUnit: currentPriceUnit - 1,
      );
    }
  }

  void increcrementePrice(int index) {
    int currentAmount = cardMemoryListDataSource[index].amount!;
    double currentPriceHigher = cardMemoryListDataSource[index].priceHigher;
    double currentPriceUnit = cardMemoryListDataSource[index].pridceUnit;
    if (currentAmount >= 3) {
      cardMemoryListDataSource[index] =
          cardMemoryListDataSource[index].copyWith(
        priceHigher: currentPriceHigher + 1,
      );
    } else {
      cardMemoryListDataSource[index] =
          cardMemoryListDataSource[index].copyWith(
        pridceUnit: currentPriceUnit + 1,
      );
    }
  }

  void priceTotal(int index) {
    int currentAmount = cardMemoryListDataSource[index].amount!;
    double currentPriceHigher = cardMemoryListDataSource[index].priceHigher;
    double currentPriceUnit = cardMemoryListDataSource[index].pridceUnit;
    if (currentAmount >= 3) {
      cardMemoryListDataSource[index] =
          cardMemoryListDataSource[index].copyWith(
        priceTotal: currentAmount * currentPriceHigher,
      );
    } else {
      cardMemoryListDataSource[index] =
          cardMemoryListDataSource[index].copyWith(
        priceTotal: currentAmount * currentPriceUnit,
      );
    }
  }

  double totalPriceAll() {
    double total = 0;

    for (var card in cardMemoryListDataSource) {
      total = total + card.priceTotal!;
    }
    return total;
  }
}
