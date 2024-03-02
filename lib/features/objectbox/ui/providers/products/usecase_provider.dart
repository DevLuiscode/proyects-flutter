import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/objectbox/domain/use_cases/products/get_products_usecase.dart';
import 'package:personal_proyects/features/objectbox/domain/use_cases/products/insert_product_usecase.dart';
import 'package:personal_proyects/features/objectbox/ui/providers/products/repository_provider.dart';

final getAllUseCaseProvider = Provider(
  (ref) {
    final productRepository = ref.watch(repositoryProvider);
    return GetProductsUseCase(productRepository: productRepository);
  },
);

final insertProductUseCaseProvider = Provider(
  (ref) {
    final productRepository = ref.watch(repositoryProvider);
    return InserProductUseCase(productRepository: productRepository);
  },
);
