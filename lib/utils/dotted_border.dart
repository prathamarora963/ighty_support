import 'dart:ui';

import 'package:flutter/material.dart';

class DottedBorder extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double borderRadius;

  const DottedBorder({
    super.key,
    this.color = Colors.black,
    this.strokeWidth = 1,
    this.gap = 3.0,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(strokeWidth / 2),
      child: CustomPaint(
        painter: DottedBorderPainter(
          color: color,
          strokeWidth: strokeWidth,
          gap: gap,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  double strokeWidth;
  Color color;
  double gap;
  double borderRadius;

  DottedBorderPainter({
    this.strokeWidth = 1.0,
    this.color = const Color(0xffD5D5D5),
    this.gap = 3.0,
    this.borderRadius = 20.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    RRect outerRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    Path outerPath = Path()..addRRect(outerRRect);

    _drawDashedPath(canvas, outerPath, dashedPaint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      bool shouldDraw = true;

      while (distance < pathMetric.length) {
        double segmentLength = gap;
        if (shouldDraw) {
          canvas.drawPath(
            pathMetric.extractPath(distance, distance + segmentLength),
            paint,
          );
        }
        distance += segmentLength;
        shouldDraw = !shouldDraw;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
