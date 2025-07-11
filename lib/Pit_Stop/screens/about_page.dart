import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(debugShowCheckedModeBanner: false,home: AboutPage(),));
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              'About PitStop',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.yellowAccent,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'PitStop is a premium car rental platform that allows users to explore, rent, and experience the world’s most exotic cars. Our mission is to bring speed and style to your doorstep with hassle-free rentals, secure payments, and trusted services.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Version: 1.0.0',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email, color: Colors.yellowAccent),
              title: Text('support@pitstop.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.yellowAccent),
              title: Text('+91 9876543210'),
            ),
          ],
        ),
      ),
    );
  }
}
