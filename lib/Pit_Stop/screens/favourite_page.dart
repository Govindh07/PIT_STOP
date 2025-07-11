import 'package:android_studio/Pit_Stop/provider/favourite_provider.dart';
import 'package:android_studio/Pit_Stop/screens/car_details_page.dart';
import 'package:android_studio/Pit_Stop/screens/cars_page.dart';
import 'package:android_studio/Pit_Stop/screens/home_page.dart';
import 'package:android_studio/Pit_Stop/screens/profile_page.dart';
import 'package:android_studio/Pit_Stop/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final int _selectedIndex = 4;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  const HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  const CarsListPage()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  const SettingsPage()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  const ProfilePage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>().favorites;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Favorites', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: favorites.isEmpty
          ? const Center(
        child: Text(
          'Your Favorite Cars will appear here.',
          style: TextStyle(color: Colors.white),
        ),
      )
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final car = favorites[index];
          return Dismissible(
            key: Key(car.name),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              context.read<FavoritesProvider>().toggleFavorite(car);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${car.name} removed from favorites')),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              tileColor: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(car.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
              ),
              title: Text(car.name, style: const TextStyle(color: Colors.white)),
              subtitle: Text(car.pricePerDay, style: const TextStyle(color: Colors.yellow)),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.yellow),
                onPressed: () {
                  context.read<FavoritesProvider>().toggleFavorite(car);
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CarDetailPage(car: car)),
                );
              },
            ),
          );
        },
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
