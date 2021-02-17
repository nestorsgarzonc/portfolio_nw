import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  GlassBox({Key key, this.child}) : super(key: key);

  final Widget child;
  final random = Random();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF000000), Color(0xFF0A0A0A)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          ...List.generate(
            random.nextInt(10) + 4,
            (_) => Positioned(
              child: BackgroundCircle(
                  color: Colors.white60, size: random.nextInt(250).toDouble(), isReverse: true),
              left: random.nextInt(size.height.toInt()).toDouble(),
              top: random.nextInt(size.height.toInt()).toDouble(),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10, tileMode: TileMode.clamp),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
                width: double.infinity,
                height: double.infinity,
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundCircle extends StatelessWidget {
  const BackgroundCircle({
    Key key,
    this.size = 100,
    this.color = Colors.grey,
    this.isReverse = false,
  }) : super(key: key);

  final double size;
  final Color color;
  final bool isReverse;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: isReverse
              ? [Color(0xFFCD1846), Color(0xFF4C18D2)].reversed.toList()
              : [Color(0xFFCD1846), Color(0xFF4C18D2)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}
