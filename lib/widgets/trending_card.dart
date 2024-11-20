import 'package:flutter/material.dart';
import '../models/trending_screening_model.dart';

class TrendingCard extends StatelessWidget {
  final TrendingScreening screening;

  const TrendingCard({Key? key, required this.screening}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate progress as a percentage
    final progress = screening.screeningDetail.totalAttend /
        screening.screeningDetail.totalTarget;

    return Card(
      color: const Color.fromARGB(255, 23, 23, 23), // Card background color
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Card radius
      ),
      child: Row(
        children: [
          // Movie Poster with rounded corners
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              screening.poster,
              width: 140, // Fixed width for the poster
              height: 240, // Fixed height to maintain proportions
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 120,
                  height: 180,
                  color: Colors.grey[800], // Fallback background color
                  child: const Icon(Icons.image, size: 40, color: Colors.white),
                );
              },
            ),
          ),

          // Text Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Align vertically
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align left horizontally
                children: [
                  // Date and Time
                  Text(
                    '${screening.date} - ${screening.time}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis, // Handle long text
                    maxLines: 2, // Limit to one line
                  ),

                  const SizedBox(height: 8),

                  // Movie Title
                  Text(
                    screening.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis, // Handle long text
                    maxLines: 2,
                  ),

                  const SizedBox(height: 8),

                  // Progress Bar with Text
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            // Progress Bar Container (with Gradient and Border)
                            Container(
                              height:
                                  24, // Increased height of the progress bar
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.grey[400]!, width: 1),
                                color: Color.fromARGB(255, 53, 53,
                                    53), // Grey background for unfilled part
                              ),
                            ),
                            // Gradient progress bar inside
                            FractionallySizedBox(
                              widthFactor:
                                  progress, // Fraction of progress (0.0 to 1.0)
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 24, // Same height as the container
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(234, 200, 86, 1),
                                      Color.fromRGBO(254, 74, 64, 1),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                              ),
                            ),
                            // Progress Text (aligned to the right)
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment
                                    .centerRight, // Aligning to the rightmost
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    '${screening.screeningDetail.totalAttend} of ${screening.screeningDetail.totalTarget}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 232, 232,
                                          232), // Text color set to black
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),

                        // Progress Detail Text (e.g., "1 person wants to go")
                        Text(
                          screening.screeningDetail.text,
                          style:
                              TextStyle(fontSize: 10, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Cinema Name with Icon
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.place,
                        size: 16,
                        color: Color.fromARGB(255, 236, 67, 107),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          screening.cinema,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Created by (Single Text, Wraps to Next Line If Needed)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundImage:
                            NetworkImage(screening.creatorDetail.profile),
                        onBackgroundImageError: (_, __) {},
                        child: const Icon(Icons.person, size: 12), // Fallback
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Created by ${screening.creatorDetail.name}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis, // Handle long text
                          maxLines: 2, // Allow up to 2 lines
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
