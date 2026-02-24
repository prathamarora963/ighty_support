import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'app_color.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => TimerScreenState();
}

class TimerScreenState extends State<TimerScreen> {
  double percentage = 0.0;
  int durationInSeconds = 60;
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (durationInSeconds == 0) {
          timer.cancel();
        } else {
          durationInSeconds--;
          percentage =
              100.0 -
              ((durationInSeconds / 60.0) *
                  100.0); // Update the percentage clockwise
        }
      });
    });
  }

  void restartTimer() {
    if (_timer.isActive) {
      return;
    }
    durationInSeconds = 30;
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.greyColor, width: 3.5),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColor.greyColor,
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.whiteColor, width: 2),
            ),
            child: CustomPaint(
              size: const Size(25, 25),
              painter: TimerPainter(
                percentage: percentage,
                outlineColor: AppColor.whiteColor,
                fillColor: AppColor.whiteColor,
                borderWidth: 10,
                borderColor: AppColor.whiteColor, //
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          durationInSeconds <= 9
              ? "00:0${durationInSeconds.toString()}"
              : "00:${durationInSeconds.toString()}",
          style: TextStyle(color: AppColor.blackColor, fontSize: 14),
        ),
      ],
    );
  }
}

class TimerPainter extends CustomPainter {
  final double percentage;
  double? borderWidth;
  final Color? outlineColor;
  final Color fillColor;

  final Color? borderColor;

  TimerPainter({
    required this.percentage,
    this.outlineColor,
    this.borderWidth,
    required this.fillColor,
    this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint outlinePaint =
        Paint()
          ..strokeCap = StrokeCap.butt
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10;

    final Paint fillPaint =
        Paint()
          ..color = fillColor
          ..style = PaintingStyle.fill;

    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);

    final double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      outlinePaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      true, // Draw a filled arc
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
