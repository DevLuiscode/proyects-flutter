import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/sqflite/domain/models/card_model.dart';
import 'package:personal_proyects/features/sqflite/domain/models/product_model.dart';
import 'package:personal_proyects/features/sqflite/domain/use_cases/cards/card_usecase.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/card/card_usecase_provider.dart';

final cardProvider =
    StateNotifierProvider<CardNotifier, List<CardModel>>((ref) {
  final cardUsecase = ref.watch(cardUsecaseProvider);
  final totalProvide = ref.read(totalProvider.notifier);
  return CardNotifier(
    cardUsecase: cardUsecase,
    totalProvide: totalProvide,
  );
});

class CardNotifier extends StateNotifier<List<CardModel>> {
  final CardUsecase cardUsecase;
  final StateController<double> totalProvide;
  CardNotifier({
    required this.cardUsecase,
    required this.totalProvide,
  }) : super([]);

  void loadData() async {
    final responseData = await cardUsecase.getAllCard();
    state = [...responseData];
  }

  void insertCard(ProductModel productModel) async {
    await cardUsecase.inserCard(productModel);
    loadData();
  }

  void deleteCard(String name) {
    cardUsecase.deleteCard(name);
    loadData();
  }

  void incrementeAmount(int index) {
    cardUsecase.incrementeAmount(index);
    priceTotalItem(index);
    loadData();
  }

  void decrementeAmount(int index) {
    cardUsecase.decrementeAmount(index);
    priceTotalItem(index);
    loadData();
  }

  void decrementePrice(int index) {
    cardUsecase.decrementePrice(index);
    priceTotalItem(index);
    loadData();
  }

  void incrementePrice(int index) {
    cardUsecase.increcrementePrice(index);
    priceTotalItem(index);
    loadData();
  }

  void priceTotalItem(int index) {
    cardUsecase.priceTotalItem(index);
    totalAll();
  }

  void totalAll() {
    totalProvide.update((total) {
      return total = cardUsecase.total();
    });
  }
}

final totalProvider = StateProvider<double>((ref) {
  return 0;
});
