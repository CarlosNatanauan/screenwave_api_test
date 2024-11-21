import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_screen.dart';
import '../providers/all_screenings_provider.dart';
import '../providers/trending_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Fetch data and ensure the splash screen is shown for at least 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to MainScreen after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });

    // You can trigger data fetching here, and it will be fetched during splash screen
    ref.read(allScreeningsProvider); // Fetch all screenings
    ref.read(trendingProvider); // Fetch trending data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Center(
        child: Image.asset(
          'assets/screenwave-logo-main.png', /
          width: 200, 
        ),
      ),
    );
  }
}
