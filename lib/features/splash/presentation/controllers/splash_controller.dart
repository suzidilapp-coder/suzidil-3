import 'dart:async';

import '../../../../core/constants/app_durations.dart';
import '../viewmodels/splash_state.dart';

class SplashController {
  SplashState _state = SplashState.initial;

  SplashState get state => _state;

  Future<void> initialize() async {
    _state = SplashState.loading;

    await Future.delayed(AppDurations.splash);

    _state = SplashState.completed;
  }
}
