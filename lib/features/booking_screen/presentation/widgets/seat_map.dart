import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../domain/entities/seat.dart';
import 'seat_tile.dart';

class SeatMap extends StatelessWidget {
  const SeatMap({required this.seats, required this.onSeatTap, super.key});

  final List<Seat> seats;
  final ValueChanged<String> onSeatTap;

  @override
  Widget build(BuildContext context) {
    final rows = seats.map((seat) => seat.row).toSet().toList()..sort();

    return Column(
      children: [
        for (final row in rows)
          Padding(
            padding: EdgeInsets.only(bottom: 7.h),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: seats
                        .where((seat) => seat.row == row)
                        .map(
                          (seat) => Expanded(
                            child: SeatTile(
                              seat: seat,
                              onTap: () => onSeatTap(seat.id),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(width: 7.w),
                SizedBox(
                  width: 46.w,
                  child: Builder(
                    builder: (context) {
                      final rowSeats = seats
                          .where((seat) => seat.row == row)
                          .toList();
                      final price = rowSeats.isEmpty ? 0 : rowSeats.first.price;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              row,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: const Color(0xFF344452),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            'EGP ${price.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: const Color(0xFF8995A1),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
