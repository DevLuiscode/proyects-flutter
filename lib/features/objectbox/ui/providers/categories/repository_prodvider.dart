import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/objectbox/data/datasource/localdata/localdata/category_local_datasource.dart';
import 'package:personal_proyects/features/objectbox/data/repository/local/category_repository_local_impl.dart';

final categoryLocalRositoryProvider = Provider((ref) {
  final categoryLocalDatasource = ref.watch(categoryLocaDatasourceProvider);
  return CategoryRepositoryLocalImpl(
      categoryLocalDatasource: categoryLocalDatasource);
});

final categoryLocaDatasourceProvider = Provider<CategoryLocalDatasource>((ref) {
  return CategoryLocalDatasource();
});
