import '../../domain/entities/seat.dart';
import '../../domain/repositories/seat_repository.dart';

class LocalSeatRepository implements SeatRepository {
  static const rowLabels = ['A', 'B', 'C', 'D', 'E', 'F'];
  static const rowPrices = [500.0, 400.0, 300.0, 250.0, 200.0, 150.0];

  @override
  List<Seat> getSeats() {
    const reserved = {'A3', 'B1', 'C10', 'D3', 'E7', 'F5'};
    const disabled = {'B6', 'D8', 'E1'};

    return [
      for (var rowIndex = 0; rowIndex < rowLabels.length; rowIndex++)
        for (var number = 1; number <= 10; number++)
          _createSeat(
            row: rowLabels[rowIndex],
            number: number,
            price: rowPrices[rowIndex],
            reserved: reserved,
            disabled: disabled,
          ),
    ];
  }

  Seat _createSeat({
    required String row,
    required int number,
    required double price,
    required Set<String> reserved,
    required Set<String> disabled,
  }) {
    final id = '$row$number';
    final status = reserved.contains(id)
        ? SeatStatus.reserved
        : disabled.contains(id)
        ? SeatStatus.disabled
        : SeatStatus.available;
    return Seat(id: id, row: row, number: number, price: price, status: status);
  }
}
