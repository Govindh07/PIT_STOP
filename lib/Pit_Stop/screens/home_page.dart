// import 'package:android_studio/Pit_Stop/model/car_model.dart';
// import 'package:android_studio/Pit_Stop/provider/favourite_provider.dart';
// import 'package:android_studio/Pit_Stop/provider/history_provider.dart';
// import 'package:android_studio/Pit_Stop/provider/theme_provider.dart';
// import 'package:android_studio/Pit_Stop/screens/car_details_page.dart';
// import 'package:android_studio/Pit_Stop/screens/cars_page.dart';
// import 'package:android_studio/Pit_Stop/screens/favourite_page.dart';
// import 'package:android_studio/Pit_Stop/screens/profile_page.dart';
// import 'package:android_studio/Pit_Stop/screens/settings_page.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(const PitStopApp());
// }
//
// class PitStopApp extends StatelessWidget {
//   const PitStopApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => FavoritesProvider()),
//         ChangeNotifierProvider(create: (_) => HistoryProvider()),
//         ChangeNotifierProvider(create: (_) => ThemeProvider()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.dark(),
//         home: const HomePage(),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//   String _searchQuery = '';
//
//   void _onItemTapped(int index) {
//     if (index == _selectedIndex) return;
//     setState(() => _selectedIndex = index);
//     if (index == 1) {
//       Navigator.push(context, MaterialPageRoute(builder: (_) => const CarsListPage()));
//     } else if (index == 2) {
//       Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage()));
//     } else if (index == 3) {
//       Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
//     } else if (index == 4) {
//       Navigator.push(context, MaterialPageRoute(builder: (_) => const FavoritesPage()));
//     }
//   }
//
//   final List<Car> featuredCars = [
//     Car(
//       name: 'Nissan GTR',
//       imageUrl: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/87/c6/3b.jpg',
//       capacity: '2 people',
//       pricePerDay: '\$100/day',
//       pricePerHour: '\$125/hr',
//       rating: 4.9,
//       details: '3.8L twin-turbo V6 · 570 bhp · 0-100 in 3s · AWD',
//     ),
//     Car(
//       name: 'BMW M3 Competition',
//       imageUrl: 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202009/BMW_M3_Competition__1200x768.jpeg?size=690:388',
//       capacity: '5 people',
//       pricePerDay: '\$150/day',
//       pricePerHour: '\$180/hr',
//       rating: 4.8,
//       details: '4.4L twin-turbo V8 · 617 bhp · 0-100 in 3.3s',
//     ),
//     Car(
//       name: 'Audi R8',
//       imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzkH2LgD7pDXr4O_B5FIbgyKJ6XljOnSz4Ow&s',
//       capacity: '2 people',
//       pricePerDay: '\$200/day',
//       pricePerHour: '\$240/hr',
//       rating: 4.7,
//       details: '5.2L V10 · 0-100 in 3.4s · 562 bhp',
//     ),
//   ];
//
//   final List<Car> allCars = [
//     Car(
//       name: 'Lamborghini Huracan',
//       imageUrl: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0a/c7/b9/d6.jpg',
//       capacity: '2 people',
//       pricePerDay: '\$300/day',
//       pricePerHour: '\$350/hr',
//       rating: 4.9,
//       details: '5.2L V10 · 631 bhp · 0-100 in 2.9s',
//     ),
//     Car(
//       name: 'Toyota Supra MK5',
//       imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTygK0NzmyK8WTuiA-LqDcvZ7kFQnuHy_ndTg&s',
//       capacity: '2 people',
//       pricePerDay: '\$120/day',
//       pricePerHour: '\$150/hr',
//       rating: 4.6,
//       details: '3.0L turbo I6 · 382 bhp · 0-100 in 4.1s',
//     ),
//     Car(
//       name: 'Chevrolet Corvette C8',
//       imageUrl: 'https://media.drive.com.au/obj/tx_q:50,rs:auto:1920:1080:1/driveau/upload/cms/uploads/9b9c4c2e-b975-562e-b784-a7767e150000',
//       capacity: '2 people',
//       pricePerDay: '\$180/day',
//       pricePerHour: '\$210/hr',
//       rating: 4.8,
//       details: '6.2L V8 · 495 bhp · 0-100 in 2.8s',
//     ),
//     Car(
//       name: 'Porsche 911 Turbo S',
//       imageUrl: 'https://images.unsplash.com/photo-1679478878845-af7294f28b27?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cG9yc2NoZSUyMDkxMSUyMHR1cmJvJTIwc3xlbnwwfHwwfHx8MA%3D%3D',
//       capacity: '4 people',
//       pricePerDay: '\$280/day',
//       pricePerHour: '\$300/hr',
//       rating: 4.9,
//       details: '3.8L twin-turbo flat-six · 640 bhp · 0-100 in 2.7s',
//     ),
//     Car(
//       name: 'Mercedes AMG GT',
//       imageUrl: 'https://robbreport.com/wp-content/uploads/2022/03/2-4.jpg?w=1000',
//       capacity: '2 people',
//       pricePerDay: '\$250/day',
//       pricePerHour: '\$270/hr',
//       rating: 4.7,
//       details: '4.0L twin-turbo V8 · 577 bhp · 0-100 in 3.5s',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Car> filteredCars = allCars
//         .where((car) => car.name.toLowerCase().contains(_searchQuery.toLowerCase()))
//         .toList();
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         automaticallyImplyLeading: false, // ✅ removes back button
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: Image.asset('assets/images/LoGo.png', height: 300),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Featured', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
//             const SizedBox(height: 10),
//             CarouselSlider(
//               options: CarouselOptions(height: 200, autoPlay: true, enlargeCenterPage: true),
//               items: featuredCars.map((car) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (_) => CarDetailPage(car: car)));
//                   },
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         Image.network(car.imageUrl, fit: BoxFit.cover),
//                         Positioned(
//                           bottom: 0,
//                           left: 0,
//                           right: 0,
//                           child: Container(
//                             padding: const EdgeInsets.all(10),
//                             color: Colors.black54,
//                             child: Text(car.name,
//                                 style: const TextStyle(
//                                     color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white12,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: TextField(
//                 style: const TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   hintText: 'Search for cars...',
//                   hintStyle: TextStyle(color: Colors.white54),
//                   prefixIcon: Icon(Icons.search, color: Colors.yellow),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(vertical: 15),
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     _searchQuery = value;
//                   });
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text('Popular Cars', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
//             const SizedBox(height: 12),
//             Column(
//               children: filteredCars.map((car) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (_) => CarDetailPage(car: car)));
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.only(bottom: 16),
//                     decoration: BoxDecoration(
//                       color: Colors.white10,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Row(
//                       children: [
//                         ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(12),
//                             bottomLeft: Radius.circular(12),
//                           ),
//                           child: Image.network(car.imageUrl, width: 120, height: 80, fit: BoxFit.cover),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(car.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
//                               Text(car.pricePerDay, style: const TextStyle(color: Colors.yellow)),
//                               Row(
//                                 children: [
//                                   const Icon(Icons.star, color: Colors.yellow, size: 16),
//                                   const SizedBox(width: 4),
//                                   Text(car.rating.toString(), style: const TextStyle(color: Colors.white70)),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.yellow,
//         unselectedItemColor: Colors.white70,
//         backgroundColor: Colors.black,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Cars'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
//         ],
//       ),
//     );
//   }
// }


import 'package:android_studio/Pit_Stop/model/car_model.dart';
import 'package:android_studio/Pit_Stop/provider/favourite_provider.dart';
import 'package:android_studio/Pit_Stop/provider/history_provider.dart';
import 'package:android_studio/Pit_Stop/provider/theme_provider.dart';
import 'package:android_studio/Pit_Stop/screens/car_details_page.dart';
import 'package:android_studio/Pit_Stop/screens/cars_page.dart';
import 'package:android_studio/Pit_Stop/screens/favourite_page.dart';
import 'package:android_studio/Pit_Stop/screens/profile_page.dart';
import 'package:android_studio/Pit_Stop/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const PitStopApp());
}

class PitStopApp extends StatelessWidget {
  const PitStopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _searchQuery = '';

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    setState(() => _selectedIndex = index);
    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const CarsListPage()));
    } else if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage()));
    } else if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
    } else if (index == 4) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const FavoritesPage()));
    }
  }

  final List<Car> featuredCars = [
    Car(
      name: 'Nissan GTR',
      imageUrl: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/12/87/c6/3b.jpg',
      capacity: '2 people',
      pricePerDay: '₹1,20,000/day',
      pricePerHour: '₹18,000/hr',
      rating: 4.9,
      details: '3.8L twin-turbo V6 · 570 bhp · 0-100 in 3s · AWD',
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
      pricePerHour: '₹25,000/hr',
      rating: 4.8,
      details: '4.4L twin-turbo V8 · 617 bhp · 0-100 in 3.3s',
      price2Hour: '₹45,000',
      price4Hour: '₹80,000',
      price6Hour: '₹1,10,000',
      priceFullDay: '₹1,50,000',
    ),
    Car(
      name: 'Audi R8',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzkH2LgD7pDXr4O_B5FIbgyKJ6XljOnSz4Ow&s',
      capacity: '2 people',
      pricePerDay: '₹2,00,000/day',
      pricePerHour: '₹30,000/hr',
      rating: 4.7,
      details: '5.2L V10 · 0-100 in 3.4s · 562 bhp',
      price2Hour: '₹55,000',
      price4Hour: '₹1,00,000',
      price6Hour: '₹1,50,000',
      priceFullDay: '₹2,00,000',
    ),
  ];

  final List<Car> allCars = [
    Car(
      name: 'Lamborghini Huracan',
      imageUrl: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0a/c7/b9/d6.jpg',
      capacity: '2 people',
      pricePerDay: '₹2,40,000/day',
      pricePerHour: '₹38,000/hr',
      rating: 4.9,
      details: '5.2L V10 · 631 bhp · 0-100 in 2.9s',
      price2Hour: '₹70,000',
      price4Hour: '₹1,20,000',
      price6Hour: '₹1,70,000',
      priceFullDay: '₹2,40,000',
    ),
    Car(
      name: 'Toyota Supra MK5',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTygK0NzmyK8WTuiA-LqDcvZ7kFQnuHy_ndTg&s',
      capacity: '2 people',
      pricePerDay: '₹1,20,000/day',
      pricePerHour: '₹20,000/hr',
      rating: 4.6,
      details: '3.0L turbo I6 · 382 bhp · 0-100 in 4.1s',
      price2Hour: '₹35,000',
      price4Hour: '₹60,000',
      price6Hour: '₹90,000',
      priceFullDay: '₹1,20,000',
    ),
    Car(
      name: 'Chevrolet Corvette C8',
      imageUrl: 'https://media.drive.com.au/obj/tx_q:50,rs:auto:1920:1080:1/driveau/upload/cms/uploads/9b9c4c2e-b975-562e-b784-a7767e150000',
      capacity: '2 people',
      pricePerDay: '₹1,80,000/day',
      pricePerHour: '₹28,000/hr',
      rating: 4.8,
      details: '6.2L V8 · 495 bhp · 0-100 in 2.8s',
      price2Hour: '₹50,000',
      price4Hour: '₹95,000',
      price6Hour: '₹1,35,000',
      priceFullDay: '₹1,80,000',
    ),
    Car(
      name: 'Porsche 911 Turbo S',
      imageUrl: 'https://images.unsplash.com/photo-1679478878845-af7294f28b27?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cG9yc2NoZSUyMDkxMSUyMHR1cmJvJTIwc3xlbnwwfHwwfHx8MA%3D%3D',
      capacity: '4 people',
      pricePerDay: '₹2,80,000/day',
      pricePerHour: '₹42,000/hr',
      rating: 4.9,
      details: '3.8L twin-turbo flat-six · 640 bhp · 0-100 in 2.7s',
      price2Hour: '₹75,000',
      price4Hour: '₹1,35,000',
      price6Hour: '₹1,95,000',
      priceFullDay: '₹2,80,000',
    ),
    Car(
      name: 'Mercedes AMG GT',
      imageUrl: 'https://robbreport.com/wp-content/uploads/2022/03/2-4.jpg?w=1000',
      capacity: '2 people',
      pricePerDay: '₹2,50,000/day',
      pricePerHour: '₹40,000/hr',
      rating: 4.7,
      details: '4.0L twin-turbo V8 · 577 bhp · 0-100 in 3.5s',
      price2Hour: '₹65,000',
      price4Hour: '₹1,20,000',
      price6Hour: '₹1,75,000',
      priceFullDay: '₹2,50,000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Car> filteredCars = allCars
        .where((car) => car.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Image.asset('assets/images/LoGo.png', height: 300),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Featured', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(height: 200, autoPlay: true, enlargeCenterPage: true),
              items: featuredCars.map((car) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CarDetailPage(car: car)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(car.imageUrl, fit: BoxFit.cover),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.black54,
                            child: Text(car.name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Search for cars...',
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(Icons.search, color: Colors.yellow),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Popular Cars', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 12),
            Column(
              children: filteredCars.map((car) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CarDetailPage(car: car)));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          child: Image.network(car.imageUrl, width: 120, height: 80, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(car.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                              Text(car.pricePerDay, style: const TextStyle(color: Colors.yellow)),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                                  const SizedBox(width: 4),
                                  Text(car.rating.toString(), style: const TextStyle(color: Colors.white70)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white70,
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
