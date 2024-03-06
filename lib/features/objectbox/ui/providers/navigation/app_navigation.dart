import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_proyects/features/objectbox/ui/providers/navigation/go_router/go_router_provider.dart';
import 'package:personal_proyects/features/objectbox/ui/screens/insert/insert_objectbox_screen.dart';

final appNavigationProvider =
    StateNotifierProvider<AppNavigationNotifier, String>((ref) {
  final goRouter = ref.watch(goRouterProvider);

  return AppNavigationNotifier(goRouter: goRouter);
});

class AppNavigationNotifier extends StateNotifier<String> {
  final GoRouter _goRouter;
  AppNavigationNotifier({required GoRouter goRouter})
      : _goRouter = goRouter,
        super("");

  void setNavigationScreen(String nameScreen) {
    switch (nameScreen) {
      case "insert_objectbox_screen":
        _goRouter.pushNamed(InserObjectboxScreen.name);
        break;
      default:
        null;
    }
  }
}
