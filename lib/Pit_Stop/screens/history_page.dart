// import 'package:android_studio/Pit_Stop/provider/history_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class HistoryPage extends StatelessWidget {
//   const HistoryPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final historyProvider = Provider.of<HistoryProvider>(context);
//     final bookings = historyProvider.bookings;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Booking History', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.black,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       backgroundColor: Colors.black,
//       body: bookings.isEmpty
//           ? const Center(child: Text('No bookings found', style: TextStyle(color: Colors.white)))
//           : ListView.builder(
//         itemCount: bookings.length,
//         itemBuilder: (context, index) {
//           final booking = bookings[index];
//           return Card(
//             color: Colors.grey[900],
//             margin: const EdgeInsets.all(8),
//             child: ListTile(
//               title: Text(booking.carName, style: const TextStyle(color: Colors.yellow)),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Booking Date: ${booking.bookingDate}', style: const TextStyle(color: Colors.white70)),
//                   Text('Pickup: ${booking.pickupLocation}', style: const TextStyle(color: Colors.white70)),
//                   Text('Drop: ${booking.dropLocation}', style: const TextStyle(color: Colors.white70)),
//                   Text('Pickup Date: ${booking.pickupDate.toLocal()}'.split(' ')[0], style: const TextStyle(color: Colors.white70)),
//                   Text('Time Slot: ${booking.timeSlot}', style: const TextStyle(color: Colors.white70)),
//                   Text('Price: ₹${booking.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.yellow)),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//


import 'package:android_studio/Pit_Stop/provider/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historyProvider = Provider.of<HistoryProvider>(context);
    final bookings = historyProvider.bookings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking History', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: bookings.isEmpty
          ? const Center(child: Text('No bookings found', style: TextStyle(color: Colors.white)))
          : ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(booking.carName, style: const TextStyle(color: Colors.yellow)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Booking Date: ${booking.bookingDate}', style: const TextStyle(color: Colors.white70)),
                  Text('Pickup: ${booking.pickupLocation}', style: const TextStyle(color: Colors.white70)),
                  Text('Drop: ${booking.dropLocation}', style: const TextStyle(color: Colors.white70)),
                  Text('Pickup Date: ${booking.pickupDate.toLocal()}'.split(' ')[0], style: const TextStyle(color: Colors.white70)),
                  Text('Time Slot: ${booking.timeSlot}', style: const TextStyle(color: Colors.white70)),
                  Text('Price: ₹${booking.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.yellow)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

