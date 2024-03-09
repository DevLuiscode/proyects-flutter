import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/sqflite/data/datasource/memorydata/memory_datasource/card_memory_datasource.dart';
import 'package:personal_proyects/features/sqflite/data/repository/memory/card_repository_impl.dart';

final cardRepositoryProvider = Provider((ref) {
  final cardMemoryData = ref.watch(cardMemoryDatasourceProvider);
  return CardMemoryRepositoryImple(cardMemoryDataSource: cardMemoryData);
});

final cardMemoryDatasourceProvider = Provider<CardMemoryDataSource>((ref) {
  return CardMemoryDataSource();
});
