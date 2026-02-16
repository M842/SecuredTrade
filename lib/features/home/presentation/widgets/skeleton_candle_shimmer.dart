
import 'package:securedtrade/config/path_config.dart';

import 'dart:math';

import 'package:flutter/material.dart';

class SkeletonCandleShimmer extends StatefulWidget {
  const SkeletonCandleShimmer({super.key});

  @override
  State<SkeletonCandleShimmer> createState() =>
      _SkeletonCandleShimmerState();
}

class _SkeletonCandleShimmerState extends State<SkeletonCandleShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return CustomPaint(
          size: const Size(double.infinity, 210),
          painter:
          SkeletonCandleShimmerPainter(_controller.value * 2 - 1),
        );
      },
    );
  }
}



class SkeletonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintBull = Paint()..color = Colors.green.shade700;
    final paintBear = Paint()..color = Colors.red.shade700;

    const candleCount = 20;
    final spacing = size.width / candleCount;
    final candleWidth = spacing * 0.5;

    for (int i = 0; i < candleCount; i++) {
      final cx = spacing * i + spacing / 2;

      // Alternate bullish/bearish look
      final isBull = i % 2 == 0;

      // Body height
      final bodyHeight = size.height * (0.15 + (i % 5) * 0.1);
      final bodyTop = size.height * (0.3 + (i % 3) * 0.1);
      final rect = Rect.fromLTWH(
        cx - candleWidth / 2,
        bodyTop,
        candleWidth,
        bodyHeight,
      );

      // Wick
      final wickTop = bodyTop - 20;
      final wickBottom = bodyTop + bodyHeight + 20;
      final wickPaint = Paint()
        ..color = isBull ? paintBull.color : paintBear.color
        ..strokeWidth = 2;

      canvas.drawLine(Offset(cx, wickTop), Offset(cx, wickBottom), wickPaint);

      // Body
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(2)),
        isBull ? paintBull : paintBear,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SkeletonCandleShimmerPainter extends CustomPainter {
  final double shimmerX;

  SkeletonCandleShimmerPainter(this.shimmerX);

  @override
  void paint(Canvas canvas, Size size) {
    const int candleCount = 24;
    const double candleWidth = 14;
    const double wickWidth = 1.5;
    const double verticalPadding = 10;

    final spacing = size.width / candleCount;
    final random = Random(1); // fixed seed → stable candles

    // 🔹 Shimmer gradient
    final shimmerPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment(shimmerX - 1, 0),
        end: Alignment(shimmerX + 1, 0),
        colors: [
          Colors.grey.shade800,
          Colors.grey.shade600,
          Colors.grey.shade800,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    for (int i = 0; i < candleCount; i++) {
      final x = i * spacing + spacing / 2;

      // Fake candle values
      final bodyHeight = random.nextDouble() * 90 + 40;
      final wickHeight = bodyHeight + random.nextDouble() * 40;

      final bodyTop =
          size.height / 2 - bodyHeight / 2 + random.nextDouble() * 20;
      final bodyBottom = bodyTop + bodyHeight;

      final wickTop = bodyTop - (wickHeight - bodyHeight) / 2;
      final wickBottom = bodyBottom + (wickHeight - bodyHeight) / 2;

      // Wick
      canvas.drawLine(
        Offset(x, wickTop),
        Offset(x, wickBottom),
        shimmerPaint..strokeWidth = wickWidth,
      );

      // Body (sharp rectangle like TradingView)
      final bodyRect = Rect.fromLTRB(
        x - candleWidth * 0.35,
        bodyTop,
        x + candleWidth * 0.35,
        bodyBottom,
      );

      canvas.drawRect(bodyRect, shimmerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
