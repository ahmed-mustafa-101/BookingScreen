import '../../domain/entities/seat.dart';

class BookingState {
  BookingState({required List<Seat> seats, this.message})
    : seats = List.unmodifiable(seats);

  final List<Seat> seats;
  final String? message;

  List<Seat> get selectedSeats => seats
      .where((seat) => seat.status == SeatStatus.selected)
      .toList(growable: false);

  double get totalPrice =>
      selectedSeats.fold(0, (total, seat) => total + seat.price);

  BookingState copyWith({
    List<Seat>? seats,
    String? message,
    bool clearMessage = false,
  }) => BookingState(
    seats: seats ?? this.seats,
    message: clearMessage ? null : message ?? this.message,
  );
}
