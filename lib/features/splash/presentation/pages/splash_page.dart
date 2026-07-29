import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../controllers/splash_controller.dart';
import '../viewmodels/splash_state.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<SplashState>>(splashControllerProvider, (
      previous,
      next,
    ) {
      next.whenData((state) {
        if (state == SplashState.completed) {
          // context.go('/home');
        }
      });
    });

    final splashState = ref.watch(splashControllerProvider);

    return Scaffold(
      body: Center(
        child: splashState.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text(error.toString()),
          data: (_) => const Text(
            AppStrings.appName,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
