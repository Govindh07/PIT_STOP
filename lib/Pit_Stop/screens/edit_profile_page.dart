// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'cars_page.dart';
// import 'favourite_page.dart';
// import 'home_page.dart';
// import 'settings_page.dart';
//
// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({super.key});
//
//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _dobController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   String? docId;
//   int _selectedIndex = 3;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }
//
//   Future<void> _loadUserData() async {
//     final user = _auth.currentUser;
//     if (user != null) {
//       final snapshot = await _firestore
//           .collection('Users')
//           .where('Email', isEqualTo: user.email)
//           .get();
//
//       if (snapshot.docs.isNotEmpty) {
//         final data = snapshot.docs.first.data() as Map<String, dynamic>;
//         docId = snapshot.docs.first.id;
//
//         setState(() {
//           _firstNameController.text = data['First Name'] ?? '';
//           _lastNameController.text = data['Last Name'] ?? '';
//           _dobController.text = data['Date of Birth'] ?? '';
//           _emailController.text = data['Email'] ?? '';
//           _phoneController.text = data['Phone Number'] ?? '';
//         });
//       }
//     }
//   }
//
//   Future<void> _saveChanges() async {
//     if (docId != null) {
//       await _firestore.collection('Users').doc(docId).update({
//         'First Name': _firstNameController.text.trim(),
//         'Last Name': _lastNameController.text.trim(),
//         'Date of Birth': _dobController.text.trim(),
//         'Email': _emailController.text.trim(),
//         'Phone Number': _phoneController.text.trim(),
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Profile updated successfully!')),
//       );
//     }
//   }
//
//   void _onNavTap(int index) {
//     if (index == _selectedIndex) return;
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
//         iconTheme: const IconThemeData(color: Colors.white),
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
//                       'https://cdn-icons-png.flaticon.com/512/149/149071.png',
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
//             const SizedBox(height: 24),
//             _buildTextField("First Name", _firstNameController),
//             const SizedBox(height: 12),
//             _buildTextField("Last Name", _lastNameController),
//             const SizedBox(height: 12),
//             _buildTextField("Date of Birth", _dobController),
//             const SizedBox(height: 12),
//             _buildTextField("Email", _emailController, readOnly: true),
//             const SizedBox(height: 12),
//             _buildTextField("Phone Number", _phoneController),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               ),
//               onPressed: _saveChanges,
//               child: const Text("Save Changes", style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.yellow,
//         unselectedItemColor: Colors.white70,
//         backgroundColor: Colors.black,
//         onTap: _onNavTap,
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
//   Widget _buildTextField(String label, TextEditingController controller, {bool readOnly = false}) {
//     return TextField(
//       controller: controller,
//       readOnly: readOnly,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.white70),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.white24),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.yellowAccent),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         filled: true,
//         fillColor: Colors.grey[900],
//       ),
//     );
//   }
// }
//


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'cars_page.dart';
import 'favourite_page.dart';
import 'home_page.dart';
import 'settings_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? docId;
  int _selectedIndex = 3;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        // First try to get by UID (recommended approach)
        DocumentSnapshot userDoc = await _firestore
            .collection('Users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          _populateFields(userDoc.data() as Map<String, dynamic>, userDoc.id);
          return;
        }

        // Fallback: Try query by email
        QuerySnapshot querySnapshot = await _firestore
            .collection('Users')
            .where('Email', isEqualTo: user.email)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          _populateFields(
              querySnapshot.docs.first.data() as Map<String, dynamic>,
              querySnapshot.docs.first.id);
          return;
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading data: ${e.toString()}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _populateFields(Map<String, dynamic> data, String documentId) {
    setState(() {
      docId = documentId;
      _firstNameController.text = data['First Name'] ?? '';
      _lastNameController.text = data['Last Name'] ?? '';
      _dobController.text = data['Date of Birth'] ?? '';
      _emailController.text = data['Email'] ?? _auth.currentUser?.email ?? '';
      _phoneController.text = data['Phone Number'] ?? '';
    });
  }

  Future<void> _saveChanges() async {
    if (docId == null) return;

    try {
      await _firestore.collection('Users').doc(docId).update({
        'First Name': _firstNameController.text.trim(),
        'Last Name': _lastNameController.text.trim(),
        'Date of Birth': _dobController.text.trim(),
        'Phone Number': _phoneController.text.trim(),
        // Don't update email here as it requires reauthentication
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
      Navigator.pop(context); // Return to profile page after saving
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update: ${e.toString()}')),
      );
    }
  }

  void _onNavTap(int index) {
    if (index == _selectedIndex) return;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.yellow))
          : SingleChildScrollView(
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
                      'https://cdn-icons-png.flaticon.com/512/149/149071.png',
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
            const SizedBox(height: 24),
            _buildTextField("First Name", _firstNameController),
            const SizedBox(height: 12),
            _buildTextField("Last Name", _lastNameController),
            const SizedBox(height: 12),
            _buildTextField("Date of Birth", _dobController),
            const SizedBox(height: 12),
            _buildTextField("Email", _emailController, readOnly: true),
            const SizedBox(height: 12),
            _buildTextField("Phone Number", _phoneController),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: _saveChanges,
              child: const Text("Save Changes",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.black,
        onTap: _onNavTap,
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

  Widget _buildTextField(String label, TextEditingController controller,
      {bool readOnly = false}) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white24),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.yellowAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[900],
      ),
    );
  }
}
