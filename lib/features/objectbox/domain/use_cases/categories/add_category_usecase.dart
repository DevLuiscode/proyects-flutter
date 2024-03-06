import 'package:personal_proyects/features/objectbox/domain/models/cateogry_model.dart';
import 'package:personal_proyects/features/objectbox/domain/repository/category_repository.dart';

class AddCateogryUsecase {
  final CategoryRepository categoryRepository;

  AddCateogryUsecase({required this.categoryRepository});
  Future<void> addCategory(CategoryModel categoryModel) async {
    await categoryRepository.addCategory(categoryModel);
  }
}
