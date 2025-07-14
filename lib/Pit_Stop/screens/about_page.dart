import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const AboutPage(),
    themeMode: ThemeMode.dark,
    theme:  ThemeData.dark(),
  ));
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
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
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Text(
              'Version: 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email, color: Colors.yellowAccent),
              title: Text('support@pitstop.com',
                  style: TextStyle(color: Colors.white70)),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.yellowAccent),
              title:
              Text('+91 9876543210', style: TextStyle(color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }
}
