import 'package:flutter/material.dart';

import '../features/splash/presentation/pages/splash_page.dart';

class SuziDilApp extends StatelessWidget {
  const SuziDilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
