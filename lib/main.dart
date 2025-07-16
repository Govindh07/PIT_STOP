import 'package:android_studio/Pit_Stop/screens/starting_page.dart';
import 'package:android_studio/Pit_Stop/screens/home_page.dart';
import 'package:android_studio/Pit_Stop/provider/favourite_provider.dart';
import 'package:android_studio/Pit_Stop/provider/history_provider.dart';
import 'package:android_studio/Pit_Stop/provider/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
              textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
              dividerColor: Colors.grey[300],
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
              textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
              dividerColor: Colors.grey,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
              ),
            ),
            home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    backgroundColor: Colors.black,
                    body: Center(child: CircularProgressIndicator(color: Colors.yellow)),
                  );
                } else if (snapshot.hasData) {
                  return const HomePage();
                } else {
                  return const StartingPage();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
