enum SeatStatus { available, selected, reserved, disabled }

class Seat {
  const Seat({
    required this.id,
    required this.row,
    required this.number,
    required this.price,
    this.status = SeatStatus.available,
  });

  final String id;
  final String row;
  final int number;
  final double price;
  final SeatStatus status;

  Seat copyWith({SeatStatus? status}) => Seat(
    id: id,
    row: row,
    number: number,
    price: price,
    status: status ?? this.status,
  );
}
