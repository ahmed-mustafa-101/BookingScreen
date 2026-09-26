import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class BookingHeader extends StatelessWidget {
  const BookingHeader({required this.onReset, super.key});

  final VoidCallback? onReset;

  @override
  Widget build(BuildContext context) => Container(
    height: 76.h,
    padding: EdgeInsets.symmetric(horizontal: 18.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x18000000),
          blurRadius: 18,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(
            'Booking Seats',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w700),
          ),
        ),
        TextButton(
          onPressed: onReset,
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF285B7A),
            backgroundColor: const Color(0xFFE4F0F7),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Text('Reset Selection', style: TextStyle(fontSize: 14.sp)),
        ),
      ],
    ),
  );
}
