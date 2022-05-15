import 'package:go_router/go_router.dart';
import 'package:synkuro/presentations/settings.dart';

import '../presentations/home.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const Settings(),
    ),
  ],
);
