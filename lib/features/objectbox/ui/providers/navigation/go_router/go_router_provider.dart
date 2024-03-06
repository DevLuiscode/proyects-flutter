import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_proyects/config/routes/app_routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return appRoutes;
});
