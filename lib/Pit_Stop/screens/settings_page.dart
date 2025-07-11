import 'package:android_studio/Pit_Stop/provider/theme_provider.dart';
import 'package:android_studio/Pit_Stop/screens/cars_page.dart';
import 'package:android_studio/Pit_Stop/screens/favourite_page.dart';
import 'package:android_studio/Pit_Stop/screens/home_page.dart';
import 'package:android_studio/Pit_Stop/screens/login_page.dart';
import 'package:android_studio/Pit_Stop/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else if (index == 1) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CarsListPage()));
    } else if (index == 3) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
    } else if (index == 4) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const FavoritesPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).textTheme.bodyLarge?.color),
        title: Text('Settings', style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.dark_mode, color: Colors.yellow),
            title: Text('Dark Mode', style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color)),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
              activeColor: Colors.yellow,
            ),
          ),
          Divider(color: Theme.of(context).dividerColor),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.yellow),
            title: Text('Privacy Policy', style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color)),
            onTap: () {
              // Handle Privacy Policy
            },
          ),
          Divider(color: Theme.of(context).dividerColor),
          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.yellow),
            title: Text('Help & Support', style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color)),
            onTap: () {
              // Handle Help & Support
            },
          ),
          Divider(color: Theme.of(context).dividerColor),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.yellow),
            title: Text('Logout', style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,

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
