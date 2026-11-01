import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/models.dart';

final reviewsProvider = Provider<List<Review>>((ref) {
  return const [
    Review(
      id: '1',
      companyName: 'Global Maritime Crewing',
      seafarerName: 'Capt. Smith',
      rating: 4.8,
      comment: 'On-time salary payments, fair contract terms, and good vessel conditions.',
    ),
    Review(
      id: '2',
      companyName: 'Ocean Star Management',
      seafarerName: 'Chief Eng. Alex',
      rating: 4.2,
      comment: 'Fast processing of flag state documents. Transparent agency fees.',
    ),
  ];
});

class CrewingReviewsScreen extends ConsumerWidget {
  const CrewingReviewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref.watch(reviewsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Crewing Ratings & Reviews')),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(review.companyName, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${review.seafarerName}\n"${review.comment}"'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text('${review.rating}', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
