import 'package:android_studio/Pit_Stop/model/booking_model.dart';
import 'package:flutter/material.dart';


class HistoryProvider with ChangeNotifier {
  final List<Booking> _bookings = [];

  List<Booking> get bookings => _bookings;

  void addBooking(Booking booking) {
    _bookings.add(booking);
    notifyListeners();
  }
}
