import 'package:flutter/material.dart';

import '../../features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  const AppRouter._();

  static const String splash = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
    }
  }
}
