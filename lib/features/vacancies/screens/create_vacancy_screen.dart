import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/data/ranks.dart';
import '../../../core/models/models.dart';
import '../providers/vacancies_provider.dart';

class CreateVacancyScreen extends ConsumerStatefulWidget {
  const CreateVacancyScreen({super.key});

  @override
  ConsumerState<CreateVacancyScreen> createState() => _CreateVacancyScreenState();
}

class _CreateVacancyScreenState extends ConsumerState<CreateVacancyScreen> {
  final _titleController = TextEditingController();
  final _salaryController = TextEditingController();
  final _vesselController = TextEditingController();
  String _selectedRank = seafarerRanks.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post New Vacancy')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Vacancy Title', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _selectedRank,
              decoration: const InputDecoration(labelText: 'Required Rank', border: OutlineInputBorder()),
              items: seafarerRanks.map((rank) {
                return DropdownMenuItem(value: rank, child: Text(rank));
              }).toList(),
              onChanged: (val) => setState(() => _selectedRank = val!),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _salaryController,
              decoration: const InputDecoration(labelText: 'Salary (e.g. \$5,000 / month)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _vesselController,
              decoration: const InputDecoration(labelText: 'Vessel Type', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              onPressed: () {
                if (_titleController.text.isNotEmpty) {
                  final newVacancy = Vacancy(
                    id: DateTime.now().toString(),
                    title: _titleController.text,
                    companyName: 'My Crewing Agency',
                    rank: _selectedRank,
                    salary: _salaryController.text,
                    vesselType: _vesselController.text,
                    contractDuration: '4 months',
                  );
                  ref.read(vacanciesProvider.notifier).update((state) => [...state, newVacancy]);
                  Navigator.pop(context);
                }
              },
              child: const Text('Publish Vacancy'),
            ),
          ],
        ),
      ),
    );
  }
}
