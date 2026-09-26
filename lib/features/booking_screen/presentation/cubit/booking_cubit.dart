import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/seat.dart';
import '../../domain/repositories/seat_repository.dart';
import '../../domain/services/seat_selection_rules.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit({
    required SeatRepository repository,
    this.rules = const SeatSelectionRules(),
  }) : _repository = repository,
       super(BookingState(seats: repository.getSeats()));

  final SeatRepository _repository;
  final SeatSelectionRules rules;

  void toggleSeat(String seatId) {
    final index = state.seats.indexWhere((seat) => seat.id == seatId);
    if (index == -1) return;

    final seat = state.seats[index];
    if (seat.status == SeatStatus.disabled) {
      _reject('This seat is out of service and cannot be booked.');
      return;
    }
    if (seat.status == SeatStatus.reserved) {
      _reject('This seat is already reserved.');
      return;
    }
    if (seat.status == SeatStatus.available &&
        !rules.canSelectSeat(state.seats, seatId)) {
      _reject('You can select up to ${rules.maxSelectedSeats} seats.');
      return;
    }

    final nextSeats = List<Seat>.from(state.seats);
    nextSeats[index] = seat.copyWith(
      status: seat.status == SeatStatus.selected
          ? SeatStatus.available
          : SeatStatus.selected,
    );
    if (!rules.keepsRowsValid(nextSeats)) {
      _reject(
        seat.status == SeatStatus.selected
            ? 'You cannot leave one available seat isolated in this row.'
            : 'Select the neighboring seat too; one available seat cannot be left isolated.',
      );
      return;
    }

    emit(BookingState(seats: nextSeats));
  }

  void resetSelection() {
    final selectedIds = state.selectedSeats.map((seat) => seat.id).toSet();
    final resetSeats = _repository.getSeats().map((seat) {
      return selectedIds.contains(seat.id)
          ? seat.copyWith(status: SeatStatus.available)
          : seat;
    }).toList();
    emit(BookingState(seats: resetSeats));
  }

  void _reject(String reason) {
    emit(state.copyWith(message: reason));
  }
}
