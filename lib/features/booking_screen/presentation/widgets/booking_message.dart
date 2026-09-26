import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class BookingMessage extends StatelessWidget {
  const BookingMessage({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
    decoration: BoxDecoration(
      color: const Color(0x33EF6C45),
      border: Border.all(color: const Color(0x66EF6C45)),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Row(
      children: [
        Icon(
          Icons.info_outline_rounded,
          color: const Color(0xFFB84D2C),
          size: 22.sp,
        ),
        SizedBox(width: 10.w),
        Expanded(child: Text(text)),
      ],
    ),
  );
}
