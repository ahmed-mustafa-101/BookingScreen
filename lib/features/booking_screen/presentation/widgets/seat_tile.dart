import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../domain/entities/seat.dart';

class SeatTile extends StatelessWidget {
  const SeatTile({required this.seat, required this.onTap, super.key});

  final Seat seat;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final unavailable =
        seat.status == SeatStatus.disabled ||
        seat.status == SeatStatus.reserved;
    final selected = seat.status == SeatStatus.selected;
    final color = selected
        ? const Color(0xFFFFD34F)
        : seat.status == SeatStatus.reserved
        ? const Color(0xFFE7434A)
        : seat.status == SeatStatus.disabled
        ? const Color.fromARGB(255, 0, 1, 3)
        : const Color(0xFF8EA2B2);
    const icon = Icons.event_seat_rounded;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: AspectRatio(
        aspectRatio: .82,
        child: Tooltip(
          message: unavailable
              ? 'Unavailable'
              : '${seat.id} - ${seat.price.toStringAsFixed(0)} EGP',
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8.r),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              decoration: selected
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: .65),
                          blurRadius: 12.r,
                        ),
                      ],
                    )
                  : null,
              child: Icon(icon, size: 28.r, color: color),
            ),
          ),
        ),
      ),
    );
  }
}
