import 'package:go_router/go_router.dart';
import 'package:personal_proyects/features/home_screen.dart';
import 'package:personal_proyects/features/sqflite/ui/screens/card/card_screen.dart';
import 'package:personal_proyects/features/sqflite/ui/screens/checkout/checkout_screen.dart';
import 'package:personal_proyects/features/sqflite/ui/screens/screens.dart';

final appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/homeobjectbox',
      name: HomeScreenObjectBox.name,
      builder: (context, state) => const HomeScreenObjectBox(),
    ),
    GoRoute(
      path: '/inserobject',
      name: InserObjectboxScreen.name,
      builder: (context, state) => const InserObjectboxScreen(),
    ),
    GoRoute(
      path: '/card',
      name: CardScreen.name,
      builder: (context, state) => const CardScreen(),
    ),
    GoRoute(
      path: '/checkout',
      name: CheckOutScreen.name,
      builder: (context, state) => const CheckOutScreen(),
    ),
  ],
);
