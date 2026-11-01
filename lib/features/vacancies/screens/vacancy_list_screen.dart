import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/vacancies_provider.dart';

class VacancyListScreen extends ConsumerWidget {
  const VacancyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vacancies = ref.watch(vacanciesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FleetWatch - Vacancies'),
      ),
      body: ListView.builder(
        itemCount: vacancies.length,
        itemBuilder: (context, index) {
          final item = vacancies[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${item.companyName}\n${item.vesselType} • ${item.contractDuration}'),
              trailing: Text(
                item.salary,
                style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),
              ),
              isThreeLine: true,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Applied for ${item.title}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
