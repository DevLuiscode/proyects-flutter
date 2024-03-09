import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/sqflite/domain/use_cases/categories/add_category_usecase.dart';
import 'package:personal_proyects/features/sqflite/domain/use_cases/categories/getall_category_usecase.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/categories/repository_prodvider.dart';

final getAllCategoriesUsecaseProvider = Provider<GetAllUsecase>((ref) {
  final categoryRepository = ref.watch(categoryLocalRositoryProvider);
  return GetAllUsecase(categoryRepository: categoryRepository);
});

final addCategoryUsecaseProvider = Provider<AddCateogryUsecase>((ref) {
  final categoryRepository = ref.watch(categoryLocalRositoryProvider);
  return AddCateogryUsecase(categoryRepository: categoryRepository);
});
