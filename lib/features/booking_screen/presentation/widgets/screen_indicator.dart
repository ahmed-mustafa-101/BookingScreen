import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ScreenIndicator extends StatelessWidget {
  const ScreenIndicator({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 78.h,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(child: CustomPaint(painter: _ScreenArcPainter())),
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Text(
            'Screen',
            style: TextStyle(fontSize: 15.sp, color: const Color(0xFF607080)),
          ),
        ),
      ],
    ),
  );
}

class _ScreenArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width * .06.w, size.height * .42.h)
      ..quadraticBezierTo(
        size.width * .5,
        size.height * .06,
        size.width * .94,
        size.height * .42,
      )
      ..lineTo(size.width * .9, size.height * .82)
      ..quadraticBezierTo(
        size.width * .5,
        size.height * .58,
        size.width * .1,
        size.height * .82,
      )
      ..close();

    canvas.drawPath(path, Paint()..color = const Color(0x223B6875));

    final arcPaint = Paint()
      ..color = const Color(0xFF50E5E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.h
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawArc(
      Rect.fromLTWH(
        size.width * .06,
        size.height * .12,
        size.width * .88,
        size.height * .58,
      ),
      3.45,
      2.28,
      false,
      arcPaint,
    );

    final sharpPaint = Paint()
      ..color = const Color(0xFF56EAF0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.h
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromLTWH(
        size.width * .06,
        size.height * .12,
        size.width * .88,
        size.height * .58,
      ),
      3.45,
      2.50,
      false,
      sharpPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
