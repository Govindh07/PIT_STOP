import 'package:android_studio/Pit_Stop/model/booking_model.dart';
import 'package:flutter/material.dart';



class BookingDetailPage extends StatelessWidget {
  final Booking booking;

  const BookingDetailPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Car: ${booking.carName}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Booking Date: ${booking.bookingDate}'),
            Text('Pickup Location: ${booking.pickupLocation}'),
            Text('Drop Location: ${booking.dropLocation}'),
            Text('Price: ₹${booking.price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
