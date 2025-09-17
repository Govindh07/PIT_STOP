// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false,home: BottomNavExample(),));
// }
//
//
// class BottomNavExample extends StatefulWidget {
//   const BottomNavExample({super.key});
//   @override
//   State<BottomNavExample> createState() => _BottomNavExampleState();
// }
//
//
// class _BottomNavExampleState extends State<BottomNavExample> {
//   int _selectedIndex = 0;
//   final List<Widget> _pages = [
//      Center(child: Text("Home Page", style: TextStyle(fontSize: 22))),
//      Center(child: Text("Search Page", style: TextStyle(fontSize: 22))),
//      Center(child: Text("Profile Page", style: TextStyle(fontSize: 22))),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("BottomNavigationBar Example")),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: BottomNav(),));
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    Center(child: Text("Home Page")),
    Center(child: Text("Settings Page")),
    Center(child: Text("Profile Page")),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navigation Bar"),),
      body:
      _pages [_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
          onTap: _onTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}

