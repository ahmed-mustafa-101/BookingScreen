import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class BookingLegend extends StatelessWidget {
  const BookingLegend({super.key});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _LegendItem(
        color: const Color(0xFF8EA2B2),
        icon: Icons.event_seat_rounded,
        label: 'Available',
      ),
      _LegendItem(
        color: const Color(0xFFFFD34F),
        icon: Icons.event_seat_rounded,
        label: 'Selected',
      ),
      _LegendItem(
        color: const Color.fromARGB(255, 0, 1, 3),
        icon: Icons.event_seat_rounded,
        label: 'Disabled',
      ),
      _LegendItem(
        color: const Color(0xFFE7434A),
        icon: Icons.event_seat_rounded,
        label: 'Reserved',
      ),
    ],
  );
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 21.r, color: color),
      SizedBox(width: 3.w),
      Text(
        label,
        style: TextStyle(fontSize: 10.sp, color: const Color(0xFF5F6B78)),
      ),
    ],
  );
}
