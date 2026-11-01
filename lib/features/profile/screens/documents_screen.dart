import 'package:flutter/material.dart';
import '../../../core/models/models.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final docs = [
      const SeafarerDocument(id: '1', title: 'Seaman\'s Book (Pasport Seaman)', expiryDate: '2028-05-12'),
      const SeafarerDocument(id: '2', title: 'STCW Basic Safety Training', expiryDate: '2027-11-20'),
      const SeafarerDocument(id: '3', title: 'Medical Certificate (ENG1 / WHO)', expiryDate: '2026-12-01'),
      const SeafarerDocument(id: '4', title: 'Advanced Firefighting', expiryDate: '2025-02-10', isExpired: true),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('My Maritime Documents')),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (context, index) {
          final doc = docs[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Icon(
                doc.isExpired ? Icons.warning_amber : Icons.verified_user,
                color: doc.isExpired ? Colors.red : Colors.green,
                size: 32,
              ),
              title: Text(doc.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Expires: ${doc.expiryDate}'),
              trailing: Chip(
                label: Text(doc.isExpired ? 'EXPIRED' : 'VALID'),
                backgroundColor: doc.isExpired ? Colors.red.shade100 : Colors.green.shade100,
                labelStyle: TextStyle(
                  color: doc.isExpired ? Colors.red.shade900 : Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
