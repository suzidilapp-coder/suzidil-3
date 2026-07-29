import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_durations.dart';
import '../viewmodels/splash_state.dart';

final splashControllerProvider =
    AutoDisposeAsyncNotifierProvider<SplashController, SplashState>(
      SplashController.new,
    );

class SplashController extends AutoDisposeAsyncNotifier<SplashState> {
  @override
  Future<SplashState> build() async {
    await Future.delayed(AppDurations.splash);

    return SplashState.completed;
  }
}
