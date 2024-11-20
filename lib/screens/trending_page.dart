import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart'; // Import the package
import '../providers/trending_provider.dart';
import '../widgets/trending_card.dart';

class TrendingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingAsync = ref.watch(trendingProvider);

    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/screenwave-logo-main.png',
          width: screenWidth * 0.5,
          fit: BoxFit.contain,
        ),
      ),
      body: trendingAsync.when(
        data: (data) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with the heading of the trending page
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    data.heading, // Use the heading from the data
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // List of trending screenings
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.results.length,
                itemBuilder: (context, index) {
                  return TrendingCard(screening: data.results[index]);
                },
              ),
            ],
          ),
        ),
        loading: () => Center(
          child: LoadingAnimationWidget.newtonCradle(
            color: Colors.white,
            size: 30,
          ),
        ),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
