import '../entities/seat.dart';

abstract interface class SeatRepository {
  List<Seat> getSeats();
}
