import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:personal_proyects/features/objectbox/domain/models/cateogry_model.dart';
import 'package:personal_proyects/features/objectbox/ui/providers/categories/categories_provider.dart';
import 'package:personal_proyects/features/objectbox/ui/providers/navigation/go_router/go_router_provider.dart';

final categoryNavigationProvider =
    StateNotifierProvider<CategoryNavigationNotifier, String>((ref) {
  final routerProvider = ref.watch(goRouterProvider);

  final categoryNotifierProvider = ref.read(categoriesProvider.notifier);
  return CategoryNavigationNotifier(
    goRoute: routerProvider,
    catogriesNotifier: categoryNotifierProvider,
  );
});

class CategoryNavigationNotifier extends StateNotifier<String> {
  final GoRouter goRoute;
  final CatogriesNotifier catogriesNotifier;
  CategoryNavigationNotifier({
    required this.goRoute,
    required this.catogriesNotifier,
  }) : super("");

  final nameCategoryController = TextEditingController();
  bool isActiveBtn = false;
  bool isLoading = false;

  void setNavigation(String screen, BuildContext? context) {
    switch (screen) {
      case "Agregar":
        showDialog(
          context: context!,
          builder: (_) {
            final size = MediaQuery.of(context).size;
            return StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState) {
                return AlertDialog(
                  title: const Text("Agregar categoria"),
                  insetPadding: EdgeInsets.zero,
                  content: SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: nameCategoryController,
                          onChanged: (value) {
                            setState(
                              () {
                                isValidForm();
                              },
                            );
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.1),
                            prefixIcon: const Icon(Iconsax.pen_add),
                            hintText: "Nombre de categoria",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: const Text('Cancelar'),
                    ),
                    isLoading
                        ? const CircularProgressIndicator()
                        : TextButton(
                            onPressed: isActiveBtn
                                ? () async {
                                    setState(
                                      () {
                                        isLoading = !isLoading;
                                      },
                                    );
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    if (context.mounted) {
                                      addCategory(context);
                                      Navigator.of(context).pop();
                                    }
                                    setState(
                                      () {
                                        isLoading = !isLoading;
                                        isActiveBtn = !isActiveBtn;
                                      },
                                    );
                                  }
                                : null,
                            child: const Text('Guardar'),
                          ),
                  ],
                );
              },
            );
          },
        );
        break;
      default:
        null;
    }
  }

  void isValidForm() {
    isActiveBtn = nameCategoryController.text.isNotEmpty;
  }

  void addCategory(BuildContext context) async {
    final categoryModel = CategoryModel(
      name: nameCategoryController.text.trim().replaceFirstMapped(
          RegExp(r'^\w'), (match) => match.group(0)!.toUpperCase()),
    );

    final isRegister = await catogriesNotifier.addCategory(categoryModel);
    if (context.mounted) {
      if (isRegister) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Categoría agregada exitosamente'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Categoría ya existe'),
          ),
        );
      }
      nameCategoryController.clear();
    }
  }
}
