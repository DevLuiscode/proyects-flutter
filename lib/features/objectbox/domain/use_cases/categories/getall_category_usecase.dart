import 'package:personal_proyects/features/objectbox/domain/repository/category_repository.dart';

import '../../models/cateogry_model.dart';

class GetAllUsecase {
  final CategoryRepository categoryRepository;

  GetAllUsecase({required this.categoryRepository});

  Future<List<CategoryModel>> getAllCategories() async {
    return await categoryRepository.getAllCategories();
  }
}
