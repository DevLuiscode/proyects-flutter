import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/sqflite/domain/use_cases/cards/card_usecase.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/card/card_repository_provider.dart';

final cardUsecaseProvider = Provider<CardUsecase>((ref) {
  final cardRepository = ref.watch(cardRepositoryProvider);
  return CardUsecase(cardRepository: cardRepository);
});
