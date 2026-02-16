
import 'package:candlesticks/candlesticks.dart';
import 'package:intl/intl.dart'show DateFormat;
import 'package:flutter/material.dart';
import 'package:securedtrade/core/theme/app_colors.dart';
import 'package:securedtrade/shared/styles/text_styles.dart';
class GridLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    final gridPaint = Paint()
      ..color = Color(0xffCDD5E9)
      ..strokeWidth = 1;

    // === Grid ===
    const int horizontalLines = 6;
    const int verticalLines = 6;
    for (int i = 0; i <= horizontalLines; i++) {
      final y = size.height / horizontalLines * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
    for (int i = 0; i <= verticalLines; i++) {
      final x = (size.width - 40) / verticalLines * i;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}



class CandlePainter extends CustomPainter {
  final List<Candle> candles;

  CandlePainter(this.candles);

  @override
  void paint(Canvas canvas, Size size) {
    const double candleWidth = 11.85;
    const double wickWidth = 2.2;
    const double verticalPadding = 0;

    final maxPrice =
    candles.map((c) => c.high).reduce((a, b) => a > b ? a : b);
    final minPrice =
    candles.map((c) => c.low).reduce((a, b) => a < b ? a : b);

    final priceRange = maxPrice - minPrice;
    final usableHeight = size.height - verticalPadding * 2;

    double scale(double price) {
      return verticalPadding +
          (1 - (price - minPrice) / priceRange) * usableHeight;
    }

    for (int i = 0; i < candles.length; i++) {
      final candle = candles[i];
      final x = i * candleWidth + candleWidth / 2;

      final openY = scale(candle.open);
      final closeY = scale(candle.close);
      final highY = scale(candle.high);
      final lowY = scale(candle.low);

      final isBull = candle.close >= candle.open;

      final bodyPaint = Paint()
        ..color = isBull ? const Color(0xFF3CCB7F) : const Color(0xFFFF4D4D)
        ..style = PaintingStyle.fill;

      final wickPaint = Paint()
        ..color = bodyPaint.color
        ..strokeWidth = 1.5
        ..strokeCap = StrokeCap.square;

      // Wick
      canvas.drawLine(
        Offset(x, highY),
        Offset(x, lowY),
        wickPaint,
      );

      // Body
      final bodyTop = isBull ? closeY : openY;
      final bodyBottom = isBull ? openY : closeY;

      final bodyRect = Rect.fromLTRB(
        x - candleWidth * 0.35,
        bodyTop,
        x + candleWidth * 0.35,
        bodyBottom,
      );

      canvas.drawRect(bodyRect, bodyPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}



class TimeLabelPainter extends CustomPainter {
  final List<Candle> candles;
  const TimeLabelPainter(this.candles);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    for (int i = 0; i < candles.length; i++) {
      if (i % 5 == 0) {
        final candle = candles[i];
        final x = size.width - 40 - (candles.length - 1 - i) * 12 - 12 / 2;

        final timeText = DateFormat("HH:mm")
            .format(candle.date.toLocal()); // only hour:minute
        final tp = TextPainter(
          text: TextSpan(
              text: timeText,
              style: getDmSansTextStyle(
                  fontSize: 12,
                  color: AppColors.black2,
                  fontWeight: FontWeight.w600)),
          textDirection: TextDirection.ltr,
        );
        tp.layout();

        tp.paint(canvas, Offset(x - tp.width / 2, size.height - 15));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
