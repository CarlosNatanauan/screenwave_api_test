import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './screens/splash_screen.dart'; // Import SplashScreen
import './screens/main_screen.dart';
import 'screens/all_screening_page.dart';
import './screens/trending_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screenwave API test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const SplashScreen(), // SplashScreen as the initial route
        '/main': (context) => const MainScreen(),
        '/all-screenings': (context) => AllScreeningsPage(),
        '/trending': (context) => TrendingPage(),
      },
    );
  }
}
