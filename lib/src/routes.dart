import 'package:go_router/go_router.dart';

import 'pages/content_import/content_import_page.dart';
import 'pages/home/layout_page.dart';
import 'pages/settings/settings_page.dart';
import 'pages/splash/empty_state_page.dart';
import 'pages/splash/splash_page.dart';
import 'pages/tag_management/tag_management_page.dart';

enum AppRoute {
  splash,
  empty,
  home,
  import,
  settings,
  tags,
}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.splash.name,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/empty',
      name: AppRoute.empty.name,
      builder: (context, state) => const EmptyStatePage(),
    ),
    GoRoute(
      path: '/home',
      name: AppRoute.home.name,
      builder: (context, state) => const LayoutPage(),
    ),
    GoRoute(
      path: '/import',
      name: AppRoute.import.name,
      builder: (context, state) => const ContentImportPage(),
    ),
    GoRoute(
      path: '/settings',
      name: AppRoute.settings.name,
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/tags',
      name: AppRoute.tags.name,
      builder: (context, state) => const TagManagementPage(),
    ),
  ],
);

