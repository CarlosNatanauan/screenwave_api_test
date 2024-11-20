import 'package:flutter/material.dart';
import '../models/all_screening_model.dart';

class AllScreeningsCard extends StatelessWidget {
  final AllScreening screening;

  const AllScreeningsCard({Key? key, required this.screening})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              topLeft: Radius.circular(12), // Top-left radius
              bottomLeft: Radius.circular(12), // Bottom-left radius
            ),
            child: Image.network(
              screening.poster,
              width: 120, // Fixed width for the poster
              height: 180, // Fixed height to maintain proportions
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
                    maxLines: 2, // Allow wrapping for longer titles
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
                          screening.cinemaDetail.name,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis, // Handle long text
                          maxLines: 1, // Limit to one line
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
                            NetworkImage(screening.cinemaDetail.profile),
                        onBackgroundImageError: (_, __) {},
                        child: const Icon(Icons.person, size: 12), // Fallback
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Created by ${screening.cinemaDetail.name}',
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
