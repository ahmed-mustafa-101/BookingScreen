import '../entities/seat.dart';

class SeatSelectionRules {
  const SeatSelectionRules({this.maxSelectedSeats = 5});

  final int maxSelectedSeats;

  bool canSelectSeat(List<Seat> seats, String seatId) {
    final seat = seats.firstWhere((item) => item.id == seatId);
    if (seat.status != SeatStatus.available) return false;
    return seats.where((item) => item.status == SeatStatus.selected).length <
        maxSelectedSeats;
  }

  bool keepsRowsValid(List<Seat> seats) {
    for (final row in seats.map((seat) => seat.row).toSet()) {
      final rowSeats = seats.where((seat) => seat.row == row).toList()
        ..sort((left, right) => left.number.compareTo(right.number));
      var availableRun = 0;
      for (final seat in rowSeats) {
        if (seat.status == SeatStatus.available) {
          availableRun++;
        } else {
          if (availableRun == 1) return false;
          availableRun = 0;
        }
      }
    }
    return true;
  }
}
