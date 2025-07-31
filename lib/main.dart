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

  final themeProvider = ThemeProvider();
  await themeProvider.loadTheme();

  runApp(PitStop(themeProvider: themeProvider));
}

class PitStop extends StatelessWidget {
  final ThemeProvider themeProvider;

  const PitStop({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProvider(create: (_) => themeProvider
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    backgroundColor: Colors.black,
                    body: Center(
                      child: CircularProgressIndicator(color: Colors.yellow),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return const HomePage();
                } else {
                  // Force light theme for StartingPage (which includes Login and Signup)
                  return Theme(
                    data: ThemeData.light(),
                    child: const StartingPage(),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
