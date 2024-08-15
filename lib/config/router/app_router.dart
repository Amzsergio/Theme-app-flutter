import 'package:go_router/go_router.dart';
import 'package:my_theme_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/theme-settings',
      name: ThemeSettingsScreen.name,
      builder: (context, state) => const ThemeSettingsScreen(),
    ),
  ],
);
