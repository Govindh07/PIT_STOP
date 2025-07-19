import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? docId;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final User? user = _auth.currentUser;

    if (user != null) {
      final QuerySnapshot snapshot = await _firestore
          .collection('Users')
          .where('Email', isEqualTo: user.email)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data() as Map<String, dynamic>;
        docId = snapshot.docs.first.id;

        setState(() {
          _firstNameController.text = data['First Name'] ?? '';
          _lastNameController.text = data['Last Name'] ?? '';
          _dobController.text = data['Date of Birth'] ?? '';
          _emailController.text = data['Email'] ?? '';
          _phoneController.text = data['Phone Number'] ?? '';
        });
      }
    }
  }

  Future<void> _saveChanges() async {
    if (docId != null) {
      await _firestore.collection('Users').doc(docId).update({
        'First Name': _firstNameController.text.trim(),
        'Last Name': _lastNameController.text.trim(),
        'Date of Birth': _dobController.text.trim(),
        'Email': _emailController.text.trim(),
        'Phone Number': _phoneController.text.trim(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User document not found!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
              onPressed: _saveChanges,
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool readOnly = false}) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
