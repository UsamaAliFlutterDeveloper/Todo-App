import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/screens/todo_screen.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 5), vsync: this)
        ..repeat();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    Timer(
        const Duration(seconds: 5),
        (() => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TodoScreen(),
            ))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051c55),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              child: Center(
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 200,
                  width: 200,
                  child: const Image(
                    image: AssetImage("assets/images/todo.jpg"),
                  ),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child,
                );
              }),
        ],
      ),
    );
  }
}
