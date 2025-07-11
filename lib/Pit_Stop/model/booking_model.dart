class Booking {
  final String id;
  final String carName;
  final String bookingDate;
  final String pickupLocation;
  final String dropLocation;
  final DateTime pickupDate;
  final String timeSlot;
  final double price;

  Booking({
    required this.id,
    required this.carName,
    required this.bookingDate,
    required this.pickupLocation,
    required this.dropLocation,
    required this.pickupDate,
    required this.timeSlot,
    required this.price,
  });
}
