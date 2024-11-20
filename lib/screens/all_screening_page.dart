import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/all_screenings_provider.dart';
import '../widgets/all_screenings_card.dart';

class AllScreeningsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allScreeningsAsync = ref.watch(allScreeningsProvider);

    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
      backgroundColor: Colors.black,
      body: allScreeningsAsync.when(
        data: (data) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with the heading of the screenings
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
              // List of screenings
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.results.length,
                itemBuilder: (context, index) {
                  return AllScreeningsCard(screening: data.results[index]);
                },
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
