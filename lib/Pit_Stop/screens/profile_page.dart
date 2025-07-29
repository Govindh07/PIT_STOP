// import 'package:android_studio/Pit_Stop/screens/about_page.dart';
// import 'package:android_studio/Pit_Stop/screens/cars_page.dart';
// import 'package:android_studio/Pit_Stop/screens/edit_profile_page.dart';
// import 'package:android_studio/Pit_Stop/screens/favourite_page.dart';
// import 'package:android_studio/Pit_Stop/screens/history_page.dart';
// import 'package:android_studio/Pit_Stop/screens/home_page.dart';
// import 'package:android_studio/Pit_Stop/screens/settings_page.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     themeMode: ThemeMode.dark,
//     home: ProfilePage(),
//   ));
// }
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   int _selectedIndex = 3;
//
//   void _onItemTapped(int index) {
//     if (index == _selectedIndex) return;
//
//     setState(() {
//       _selectedIndex = index;
//     });
//
//     switch (index) {
//       case 0:
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
//         break;
//       case 1:
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CarsListPage()));
//         break;
//       case 2:
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SettingsPage()));
//         break;
//       case 4:
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const FavoritesPage()));
//         break;
//     }
//   }
//
//   void _navigateToEditProfile() {
//     Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfilePage()));
//   }
//
//   void _navigateToHistory() {
//     Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryPage()));
//   }
//
//   void _navigateToAbout() {
//     Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('Profile', style: TextStyle(color: Colors.white)),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () {
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Center(
//               child: Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   const CircleAvatar(
//                     radius: 50,
//                     backgroundImage: NetworkImage(
//                       'https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(4),
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.yellowAccent,
//                     ),
//                     child: const Icon(Icons.edit, size: 16, color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 12),
//             const Text(
//               'Govindh V',
//               style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               'govindh123@gmail.com',
//               style: TextStyle(color: Colors.white60),
//             ),
//             const SizedBox(height: 24),
//             buildProfileOption(Icons.person_outline, 'Profile Edit', _navigateToEditProfile),
//             buildProfileOption(Icons.account_balance_wallet, 'History', _navigateToHistory),
//             buildProfileOption(Icons.help_outline, 'About', _navigateToAbout),
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
//
//   Widget buildProfileOption(IconData icon, String title, VoidCallback onTap) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: Colors.yellowAccent),
//         title: Text(title, style: const TextStyle(color: Colors.white)),
//         trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
//         onTap: onTap,
//       ),
//     );
//   }
// }

import 'package:android_studio/Pit_Stop/screens/about_page.dart';
import 'package:android_studio/Pit_Stop/screens/cars_page.dart';
import 'package:android_studio/Pit_Stop/screens/edit_profile_page.dart';
import 'package:android_studio/Pit_Stop/screens/favourite_page.dart';
import 'package:android_studio/Pit_Stop/screens/history_page.dart';
import 'package:android_studio/Pit_Stop/screens/home_page.dart';
import 'package:android_studio/Pit_Stop/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3;

  String fullName = 'Loading...';
  String email = '';

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final docSnapshot = await FirebaseFirestore.instance
          .collection('Users') // <-- Note the capital U ✅
          .doc(user.uid)
          .get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        if (data != null) {
          setState(() {
            fullName = '${data['First Name']} ${data['Last Name']}';
            email = data['Email'];
          });
        }
      } else {
        setState(() {
          fullName = 'No Name Found';
          email = 'No Email';
        });
      }
    } catch (e) {
      print('Error fetching user details: $e');
      setState(() {
        fullName = 'Error loading';
        email = '';
      });
    }
  }

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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CarsListPage()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SettingsPage()));
        break;
      case 4:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const FavoritesPage()));
        break;
    }
  }

  void _navigateToEditProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfilePage()));
  }

  void _navigateToHistory() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryPage()));
  }

  void _navigateToAbout() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellowAccent,
                    ),
                    child: const Icon(Icons.edit, size: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              fullName,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: const TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 24),
            buildProfileOption(Icons.person_outline, 'Profile Edit', _navigateToEditProfile),
            buildProfileOption(Icons.account_balance_wallet, 'History', _navigateToHistory),
            buildProfileOption(Icons.help_outline, 'About', _navigateToAbout),
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

  Widget buildProfileOption(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.yellowAccent),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
        onTap: onTap,
      ),
    );
  }
}
