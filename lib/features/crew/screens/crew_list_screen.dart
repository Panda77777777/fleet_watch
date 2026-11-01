import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/crew_provider.dart';

class CrewListScreen extends ConsumerWidget {
  const CrewListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crew = ref.watch(crewProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crew & Watch Roster'),
      ),
      body: ListView.builder(
        itemCount: crew.length,
        itemBuilder: (context, index) {
          final member = crew[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(member.rank.substring(0, member.rank.length > 2 ? 2 : member.rank.length)),
              ),
              title: Text(member.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${member.rank} • Watch: ${member.watchSchedule}'),
              trailing: Switch(
                value: member.isOnWatch,
                onChanged: (_) {
                  ref.read(crewProvider.notifier).toggleWatch(member.id);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
