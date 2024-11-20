import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart'; // Import the package
import '../providers/all_screenings_provider.dart';
import '../providers/trending_provider.dart';
import '../widgets/all_screenings_card.dart';
import '../widgets/trending_card.dart';
import 'all_screening_page.dart';
import 'trending_page.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allScreeningsAsync = ref.watch(allScreeningsProvider);
    final trendingAsync = ref.watch(trendingProvider);

    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black, // Set AppBar background to black
        elevation: 0, // Remove the shadow
        centerTitle: true, // Center the content of the AppBar
        title: Image.asset(
          'assets/screenwave-logo-main.png', // Use your PNG image from assets
          width: screenWidth * 0.8, // Set the width as 50% of the screen width
          fit: BoxFit.contain, // Ensure the image scales properly
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trending Section
            trendingAsync.when(
              data: (data) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            '${data.heading}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500, // Changed to w500
                              color: Colors.white, // Set to white
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TrendingPage()),
                            );
                          },
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 236, 67, 107), // Set custom RGB color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Cards (First 3 Items)
                  ...data.results
                      .take(3)
                      .map((screening) => TrendingCard(screening: screening)),
                ],
              ),
              loading: () => Center(
                child: LoadingAnimationWidget.newtonCradle(
                  color: Colors.white,
                  size: 30, // You can adjust the size here
                ),
              ),
              error: (err, _) => Center(child: Text('Error: $err')),
            ),

            const SizedBox(height: 16),

            // All Screenings Section
            allScreeningsAsync.when(
              data: (data) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            '${data.heading}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500, // Changed to w500
                              color: Colors.white, // Set to white
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllScreeningsPage()),
                            );
                          },
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 236, 67, 107), // Set custom RGB color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Cards (First 3 Items)
                  ...data.results.take(3).map(
                      (screening) => AllScreeningsCard(screening: screening)),
                ],
              ),
              loading: () => Center(
                child: LoadingAnimationWidget.newtonCradle(
                  color: Colors.white,
                  size: 30,
                ),
              ),
              error: (err, _) => Center(child: Text('Error: $err')),
            ),
          ],
        ),
      ),
    );
  }
}
