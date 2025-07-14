import 'package:android_studio/Pit_Stop/model/car_model.dart';
import 'package:android_studio/Pit_Stop/screens/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Added for Firestore

class LocationPage extends StatefulWidget {
  final Car car;

  const LocationPage({super.key, required this.car});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String? selectedPickupLocation;
  String? selectedDropLocation;

  DateTime? selectedDate;
  String selectedTimeSlot = '2 Hour Package';

  final List<String> pickupLocations = [
    'MG Road',
    'Infopark',
    'Lulu Mall',
    'Marine Drive',
    'Edappally'
  ];

  final List<String> dropLocations = [
    'Vytilla',
    'Kaloor',
    'Fort Kochi',
    'Palarivattom',
    'Kakkanad'
  ];

  final List<String> timeSlots = [
    '2 Hour Package',
    '4 Hour Package',
    '6 Hour Package',
    'Full Day'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.yellow[700]!,
              onPrimary: Colors.black,
              surface: Colors.grey[800]!,
              onSurface: Colors.white,
            ),
            dialogTheme: DialogThemeData(backgroundColor: Colors.grey[900]),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> saveBookingToFirestore() async {
    final bookingData = {
      'carName': widget.car.name,
      'pickupLocation': selectedPickupLocation,
      'dropLocation': selectedDropLocation,
      'pickupDate': '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
      'timeSlot': selectedTimeSlot,
      'timestamp': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance.collection('Bookings').add(bookingData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Pickup & Drop'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.car.name,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),

                const Text(
                  'Pickup Location',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedPickupLocation,
                  dropdownColor: Colors.grey[900],
                  style: const TextStyle(color: Colors.white),
                  hint: const Text('Select pickup location',
                      style: TextStyle(color: Colors.grey)),
                  items: pickupLocations
                      .map((location) => DropdownMenuItem(
                    value: location,
                    child: Text(location,
                        style: const TextStyle(color: Colors.white)),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPickupLocation = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.yellow[700]!),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'Drop Location',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedDropLocation,
                  dropdownColor: Colors.grey[900],
                  style: const TextStyle(color: Colors.white),
                  hint: const Text('Select drop location',
                      style: TextStyle(color: Colors.grey)),
                  items: dropLocations
                      .map((location) => DropdownMenuItem(
                    value: location,
                    child: Text(location,
                        style: const TextStyle(color: Colors.white)),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDropLocation = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.yellow[700]!),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'Pickup Date',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 18),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDate == null
                              ? 'Select pickup date'
                              : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                        Icon(Icons.calendar_today, color: Colors.yellow[700]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'Select Time Slot',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedTimeSlot,
                  dropdownColor: Colors.grey[900],
                  style: const TextStyle(color: Colors.white),
                  items: timeSlots
                      .map((slot) => DropdownMenuItem(
                    value: slot,
                    child: Text(slot,
                        style: const TextStyle(color: Colors.white)),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTimeSlot = value!;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.yellow[700]!),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (selectedPickupLocation == null ||
                          selectedDropLocation == null ||
                          selectedDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please fill all the fields.')),
                        );
                        return;
                      }

                      await saveBookingToFirestore(); // Save booking info

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PaymentPage(
                            car: widget.car,
                            pickupLocation: selectedPickupLocation!,
                            dropLocation: selectedDropLocation!,
                            pickupDate: selectedDate!,
                            timeSlot: selectedTimeSlot,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    child: const Text('Proceed to Payment',
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
