import 'package:android_studio/Pit_Stop/model/car_model.dart';
import 'package:android_studio/Pit_Stop/screens/car_details_page.dart';
import 'package:android_studio/Pit_Stop/screens/home_page.dart';
import 'package:android_studio/Pit_Stop/screens/login_page.dart';
import 'package:android_studio/Pit_Stop/screens/profile_page.dart';
import 'package:android_studio/Pit_Stop/screens/settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: CarsListPage()));
}

class CarsListPage extends StatefulWidget {
  const CarsListPage({super.key});

  @override
  State<CarsListPage> createState() => _CarsListPageState();
}

class _CarsListPageState extends State<CarsListPage> {
  int _selectedIndex = 1;

  final List<Car> cars = [
    Car(
      name: 'Nissan GTR',
      imageUrl: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/87/c6/3b.jpg',
      capacity: '2 people',
      pricePerDay: '₹1,20,000/day',
      pricePerHour: '₹18,000/hr',
      rating: 4.9,
      details: 'The Nissan GT-R, ...',
      price2Hour: '₹35,000',
      price4Hour: '₹60,000',
      price6Hour: '₹85,000',
      priceFullDay: '₹1,20,000',
    ),
    Car(
      name: 'BMW M3 Competition',
      imageUrl: 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202009/BMW_M3_Competition__1200x768.jpeg?size=690:388',
      capacity: '5 people',
      pricePerDay: '₹1,50,000/day',
      pricePerHour: '₹22,000/hr',
      rating: 4.8,
      details: 'The BMW M3 Competition ...',
      price2Hour: '₹40,000',
      price4Hour: '₹70,000',
      price6Hour: '₹1,10,000',
      priceFullDay: '₹1,50,000',
    ),
    Car(
      name: 'Audi R8',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzkH2LgD7pDXr4O_B5FIbgyKJ6XljOnSz4Ow&s',
      capacity: '2 people',
      pricePerDay: '₹2,20,000/day',
      pricePerHour: '₹30,000/hr',
      rating: 4.7,
      details: 'The Audi R8 ...',
      price2Hour: '₹55,000',
      price4Hour: '₹95,000',
      price6Hour: '₹1,60,000',
      priceFullDay: '₹2,20,000',
    ),
    Car(
      name: 'Lamborghini Huracan',
      imageUrl: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0a/c7/b9/d6.jpg',
      capacity: '2 people',
      pricePerDay: '₹3,00,000/day',
      pricePerHour: '₹42,000/hr',
      rating: 4.9,
      details: 'The Lamborghini Huracán ...',
      price2Hour: '₹70,000',
      price4Hour: '₹1,30,000',
      price6Hour: '₹2,00,000',
      priceFullDay: '₹3,00,000',
    ),
    Car(
      name: 'Toyota Supra MK5',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTygK0NzmyK8WTuiA-LqDcvZ7kFQnuHy_ndTg&s',
      capacity: '2 people',
      pricePerDay: '₹1,00,000/day',
      pricePerHour: '₹14,000/hr',
      rating: 4.6,
      details: 'The Toyota Supra MK5 ...',
      price2Hour: '₹25,000',
      price4Hour: '₹45,000',
      price6Hour: '₹70,000',
      priceFullDay: '₹1,00,000',
    ),
    Car(
      name: 'Chevrolet Corvette C8',
      imageUrl: 'https://media.drive.com.au/obj/tx_q:50,rs:auto:1920:1080:1/driveau/upload/cms/uploads/9b9c4c2e-b975-562e-b784-a7767e150000',
      capacity: '2 people',
      pricePerDay: '₹1,80,000/day',
      pricePerHour: '₹25,000/hr',
      rating: 4.8,
      details: 'The Chevrolet Corvette C8 ...',
      price2Hour: '₹50,000',
      price4Hour: '₹90,000',
      price6Hour: '₹1,40,000',
      priceFullDay: '₹1,80,000',
    ),
    Car(
      name: 'Porsche 911 Turbo S',
      imageUrl: 'https://images.unsplash.com/photo-1679478878845-af7294f28b27?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cG9yc2NoZSUyMDkxMSUyMHR1cmJvJTIwc3xlbnwwfHwwfHx8MA%3D%3D',
      capacity: '4 people',
      pricePerDay: '₹2,80,000/day',
      pricePerHour: '₹38,000/hr',
      rating: 4.9,
      details: 'The Porsche 911 Turbo S ...',
      price2Hour: '₹65,000',
      price4Hour: '₹1,20,000',
      price6Hour: '₹2,00,000',
      priceFullDay: '₹2,80,000',
    ),
    Car(
      name: 'Mercedes AMG GT',
      imageUrl: 'https://robbreport.com/wp-content/uploads/2022/03/2-4.jpg?w=1000',
      capacity: '2 people',
      pricePerDay: '₹2,50,000/day',
      pricePerHour: '₹35,000/hr',
      rating: 4.7,
      details: 'The Mercedes-AMG GT ...',
      price2Hour: '₹60,000',
      price4Hour: '₹1,10,000',
      price6Hour: '₹1,70,000',
      priceFullDay: '₹2,50,000',
    ),
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SettingsPage()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
        break;
      case 4:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('All Cars', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CarDetailPage(car: car)),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      car.imageUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    car.name,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Capacity: ${car.capacity} · ${car.pricePerDay}',
                    style: const TextStyle(color: Colors.white60),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('From: ${car.pricePerHour}', style: const TextStyle(color: Colors.white70)),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow, size: 18),
                          const SizedBox(width: 4),
                          Text(car.rating.toString(), style: const TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white60,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Cars'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
    );
  }
}
