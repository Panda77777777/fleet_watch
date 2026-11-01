import 'package:flutter/material.dart';
import '../../../core/models/models.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apps = [
      const JobApplication(
        id: '1',
        vacancyTitle: 'ETO for Oil Tanker',
        companyName: 'Ocean Star Management',
        seafarerName: 'Self',
        status: 'Under Review',
      ),
      const JobApplication(
        id: '2',
        vacancyTitle: 'Chief Engineer on Container Ship',
        companyName: 'Global Maritime Crewing',
        seafarerName: 'Self',
        status: 'Shortlisted',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('My Job Applications')),
      body: ListView.builder(
        itemCount: apps.length,
        itemBuilder: (context, index) {
          final app = apps[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(app.vacancyTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(app.companyName),
              trailing: Chip(
                label: Text(app.status),
                backgroundColor: Colors.blue.shade100,
                labelStyle: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
