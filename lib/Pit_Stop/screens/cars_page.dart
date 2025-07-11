import 'package:android_studio/Pit_Stop/model/car_model.dart';
import 'package:android_studio/Pit_Stop/screens/car_details_page.dart';
import 'package:android_studio/Pit_Stop/screens/home_page.dart';
import 'package:android_studio/Pit_Stop/screens/login_page.dart';
import 'package:android_studio/Pit_Stop/screens/profile_page.dart';
import 'package:android_studio/Pit_Stop/screens/settings_page.dart';
import 'package:flutter/material.dart';



void main(){
  runApp(const MaterialApp(debugShowCheckedModeBanner: false,home: CarsListPage(),)
  );
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
      pricePerDay: '\$100/day',
      pricePerHour: '\$125/hr',
      rating: 4.9,
      details: 'The Nissan GT-R, often dubbed "Godzilla," is a high-performance sports car known for its exceptional speed, precision engineering, and everyday usability. Powered by a hand-built 3.8-liter twin-turbocharged V6 engine, the GT-R delivers around 565 horsepower and 467 lb-ft of torque, launching it from 0 to 100 km/h in under 3 seconds. It features an advanced all-wheel-drive system, a 6-speed dual-clutch transmission, and a sophisticated suspension setup for sharp handling and traction. The GT-R’s aerodynamic design, aggressive stance, and tech-rich interior make it both a thrilling track machine and a comfortable grand tourer, blending raw power with Japanese engineering excellence',
    ),
    Car(
      name: 'BMW M3 Competition',
      imageUrl: 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202009/BMW_M3_Competition__1200x768.jpeg?size=690:388',
      capacity: '5 people',
      pricePerDay: '\$150/day',
      pricePerHour: '\$180/hr',
      rating: 4.8,
      details: 'The BMW M3 Competition is a high-performance sports sedan that combines luxury, cutting-edge technology, and raw driving power. It’s equipped with a 3.0-liter BMW M TwinPower Turbo inline-6 engine that produces 503 horsepower and 479 lb-ft of torque, paired with an 8-speed M Steptronic automatic transmission. The M3 Competition accelerates from 0 to 100 km/h in just 3.8 seconds and offers either rear-wheel drive or BMW’s xDrive all-wheel-drive system for enhanced traction. With adaptive M suspension, M Sport differential, and precise steering, it delivers outstanding handling and track-ready performance. Inside, it features premium materials, M-specific digital displays, and advanced driver aids, making it a refined yet aggressive everyday powerhouse.',
    ),
    Car(
      name: 'Audi R8',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzkH2LgD7pDXr4O_B5FIbgyKJ6XljOnSz4Ow&s',
      capacity: '2 people',
      pricePerDay: '\$200/day',
      pricePerHour: '\$240/hr',
      rating: 4.7,
      details: 'The Audi R8 is a flagship supercar that blends stunning design with race-inspired performance. At its heart is a naturally aspirated 5.2-liter V10 engine that delivers up to 602 horsepower and 413 lb-ft of torque in the R8 V10 Performance Quattro variant, allowing it to accelerate from 0 to 100 km/h in just 3.1 seconds. It features Audi’s renowned Quattro all-wheel-drive system for exceptional grip and cornering, along with a 7-speed S tronic dual-clutch transmission for lightning-fast shifts. The R8’s lightweight construction, adaptive suspension, and aerodynamic body enhance both speed and stability. Inside, it offers a driver-focused cockpit with Audi Virtual Cockpit, premium materials, and minimalist luxury, making it a thrilling yet refined supercar for the road.',
    ),
    Car(
      name: 'Lamborghini Huracan',
      imageUrl: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/0a/c7/b9/d6.jpg',
      capacity: '2 people',
      pricePerDay: '\$300/day',
      pricePerHour: '\$350/hr',
      rating: 4.9,
      details: 'The Lamborghini Huracán is a high-performance supercar that combines aggressive Italian styling with blistering speed and precision engineering. It is powered by a naturally aspirated 5.2-liter V10 engine, producing up to 631 horsepower and 443 lb-ft of torque in the Huracán EVO AWD variant. This allows it to sprint from 0 to 100 km/h in just 2.9 seconds, with a top speed exceeding 325 km/h. The Huracán features a 7-speed dual-clutch transmission, advanced all-wheel-drive system, and Lamborghini’s Dynamic Steering and LDVI (Lamborghini Dinamica Veicolo Integrata) for responsive handling. With a lightweight chassis, sharp aerodynamics, and a dramatic cockpit wrapped in Alcantara and carbon fiber, the Huracán delivers a visceral, track-ready experience while remaining remarkably drivable on everyday roads.',
    ),
    Car(
      name: 'Toyota Supra MK5',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTygK0NzmyK8WTuiA-LqDcvZ7kFQnuHy_ndTg&s',
      capacity: '2 people',
      pricePerDay: '\$120/day',
      pricePerHour: '\$150/hr',
      rating: 4.6,
      details: 'The Toyota Supra MK5, also known as the GR Supra, is a modern sports car that blends sleek design with sharp performance, developed in collaboration with BMW. Under the hood, it features a 3.0-liter turbocharged inline-6 engine producing 382 horsepower and 368 lb-ft of torque, paired with an 8-speed automatic transmission or an optional 6-speed manual in recent models. This setup allows the MK5 Supra to accelerate from 0 to 100 km/h in around 4.1 seconds. It uses a rear-wheel-drive platform for a classic sports car feel, complemented by adaptive suspension and an active differential for improved handling. The GR Supra also includes a sporty, driver-focused interior with digital displays, supportive bucket seats, and a premium sound system, making it a balanced mix of power, agility, and daily usability.',
    ),
    Car(
      name: 'Chevrolet Corvette C8',
      imageUrl: 'https://media.drive.com.au/obj/tx_q:50,rs:auto:1920:1080:1/driveau/upload/cms/uploads/9b9c4c2e-b975-562e-b784-a7767e150000',
      capacity: '2 people',
      pricePerDay: '\$180/day',
      pricePerHour: '\$210/hr',
      rating: 4.8,
      details: 'The Chevrolet Corvette C8 marks a bold shift into the supercar arena with its mid‑engine layout and potent 6.2‑liter naturally aspirated LT2 V‑8. In its Stingray form, the engine delivers around 490 hp (495 hp with the Z51 performance package) and 470 lb‑ft (637 Nm) of torque, enabling a blistering 0–100 km/h sprint in about 2.9 seconds and a top speed of approximately 312 km/h ([mototechindia.com][1]). Power is sent to the rear wheels through GM’s first dual‑clutch 8‑speed automatic transmission, offering rapid shifts (<100 ms) and launch‑control capability . The chassis features double‑wishbone suspension with Magnetic Ride Control, Brembo brakes (6‑piston front, 4‑piston rear), and Michelin Pilot Sport tires (245/35‑19 front, 305/30‑20 rear) ([mototechindia.com][1]). With a curb weight around 1,730 kg and dual trunks totaling 13 cu ft, the Corvette C8 blends supercar performance with surprising practicality ([caranddriver.com][2]). Inside, a driver‑focused cockpit features a 12‑inch digital gauge cluster, touchscreen infotainment, and premium materials—a refined environment for its thrilling mechanical prowess.',
    ),
    Car(
      name: 'Porsche 911 Turbo S',
      imageUrl: 'https://images.unsplash.com/photo-1679478878845-af7294f28b27?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cG9yc2NoZSUyMDkxMSUyMHR1cmJvJTIwc3xlbnwwfHwwfHx8MA%3D%3D',
      capacity: '4 people',
      pricePerDay: '\$280/day',
      pricePerHour: '\$300/hr',
      rating: 4.9,
      details: 'The Porsche 911 Turbo S is a benchmark in high-performance sports cars, combining iconic design with blistering speed and everyday usability. It’s powered by a 3.8-liter twin-turbocharged flat-six engine that produces an impressive 641 horsepower and 590 lb-ft of torque. Paired with an 8-speed PDK dual-clutch transmission and Porsches all-wheel-drive system, it launches from 0 to 100 km/h in just 2.7 seconds, with a top speed of 330 km/h. The Turbo S features active aerodynamics, rear-axle steering, and adaptive suspension (PASM) for superb handling and stability. Inside, it blends luxury with sportiness, offering leather-trimmed seats, a digital instrument cluster, and Porsche’s intuitive infotainment system. Overall, the 911 Turbo S is a masterclass in precision engineering and performance.',
    ),
    Car(
      name: 'Mercedes AMG GT',
      imageUrl: 'https://robbreport.com/wp-content/uploads/2022/03/2-4.jpg?w=1000',
      capacity: '2 people',
      pricePerDay: '\$250/day',
      pricePerHour: '\$270/hr',
      rating: 4.7,
      details: 'The Mercedes-AMG GT is a high-performance grand tourer that blends aggressive styling with track-capable dynamics. It features a handcrafted 4.0-liter twin-turbocharged V8 engine, delivering between 523 to 720 horsepower depending on the variant (with the AMG GT Black Series topping the range). In the GT R trim, it produces 577 hp and 516 lb-ft of torque, enabling a 0–100 km/h sprint in just 3.6 seconds and a top speed of around 319 km/h. Power is sent to the rear wheels through a 7-speed dual-clutch transmission for sharp, responsive shifts. The AMG GT boasts a low-slung aluminum space frame, active aerodynamics, rear-wheel steering (in higher trims), and adaptive suspension, making it both agile on the track and refined on the road. Inside, the cabin features a motorsport-inspired layout with premium materials, digital displays, and AMG-specific controls, offering a balance of luxury and performance.',
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
      // Already on CarsListPage
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  const SettingsPage()));
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
