import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../domain/entities/seat.dart';

class BookingSummary extends StatelessWidget {
  const BookingSummary({
    required this.selectedSeats,
    required this.totalPrice,
    super.key,
  });

  final List<Seat> selectedSeats;
  final double totalPrice;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(18.w, 16.h, 12.w, 16.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24.r),
      border: Border.all(color: const Color(0xFFDCE3EA)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x16000000),
          blurRadius: 18,
          offset: Offset(0, 6),
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total: ${totalPrice.toStringAsFixed(0)} EGP',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 3.h),
              Text(
                '${selectedSeats.length} Seats Selected',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xFF6B7785),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        ElevatedButton(
          onPressed: selectedSeats.isEmpty ? null : () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4DD68C),
            foregroundColor: Colors.white,
            disabledBackgroundColor: const Color(0xFFD5DCE3),
            disabledForegroundColor: const Color(0xFF8995A1),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.r),
            ),
            elevation: 0,
          ),
          child: Text(
            'Confirm Booking',
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    ),
  );
}
