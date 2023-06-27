import 'package:flutter/material.dart';

class DisappearingText extends StatefulWidget {
  @override
  _DisappearingTextState createState() => _DisappearingTextState();
}

class _DisappearingTextState extends State<DisappearingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: child,
        );
      },
      child: const Text(
        'Hello, World!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
