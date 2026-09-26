import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import '../../domain/repositories/seat_repository.dart';
import '../cubit/booking_cubit.dart';
import '../cubit/booking_state.dart';
import '../widgets/booking_header.dart';
import '../widgets/booking_legend.dart';
import '../widgets/booking_message.dart';
import '../widgets/booking_summary.dart';
import '../widgets/screen_indicator.dart';
import '../widgets/seat_map.dart';

class BookingScreenHost extends StatelessWidget {
  const BookingScreenHost({required this.repository, super.key});

  final SeatRepository repository;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => BookingCubit(repository: repository),
    child: const BookingScreen(),
  );
}

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<BookingCubit, BookingState>(
    builder: (context, state) {
      final cubit = context.read<BookingCubit>();
      final selected = state.selectedSeats;

      return Scaffold(
        backgroundColor: const Color(0xFFF5F7FA),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 18.h),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 900.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BookingHeader(
                      onReset: selected.isEmpty ? null : cubit.resetSelection,
                    ),
                    SizedBox(height: 18.h),
                    const ScreenIndicator(),
                    SizedBox(height: 50.h),
                    const BookingLegend(),
                    SizedBox(height: 18.h),
                    SeatMap(seats: state.seats, onSeatTap: cubit.toggleSeat),
                    if (state.message != null) ...[
                      SizedBox(height: 12.h),
                      BookingMessage(text: state.message!),
                    ],
                    SizedBox(height: 16.h),
                    BookingSummary(
                      selectedSeats: selected,
                      totalPrice: state.totalPrice,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
