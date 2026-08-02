import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<double> _scale;
  late final AudioPlayer _player;

  @override
  void initState() {
    super.initState();

    _player = AudioPlayer();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _scale = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 300), () async {
      try {
        await _player.play(AssetSource('audio/besmele.mp3'));

        debugPrint('✅ Besmele çaldı.');
      } catch (e) {
        debugPrint('❌ Ses Hatası: $e');
      }
    });

    Timer(const Duration(seconds: 6), () {
      if (!mounted) return;

      context.go('/home');
    });
  }

  @override
  void dispose() {
    _player.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _opacity,
        child: ScaleTransition(
          scale: _scale,
          child: SizedBox.expand(
            child: Image.asset('assets/images/splash.png', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
