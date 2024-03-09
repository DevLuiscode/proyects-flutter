import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/navigation/go_router/go_router_provider.dart';
import 'package:personal_proyects/features/sqflite/ui/screens/card/card_screen.dart';
import 'package:personal_proyects/features/sqflite/ui/screens/checkout/checkout_screen.dart';
import 'package:personal_proyects/features/sqflite/ui/screens/insert/insert_objectbox_screen.dart';

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
      case "card_screen":
        _goRouter.pushNamed(CardScreen.name);
        break;
      case "checkout_screen":
        _goRouter.pushNamed(CheckOutScreen.name);
        break;
      default:
        null;
    }
  }
}
