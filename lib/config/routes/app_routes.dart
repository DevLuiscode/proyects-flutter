import 'package:go_router/go_router.dart';
import 'package:personal_proyects/features/home_screen.dart';
import 'package:personal_proyects/features/objectbox/ui/screens/screens.dart';

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
  ],
);
