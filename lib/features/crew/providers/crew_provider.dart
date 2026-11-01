import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/crew_member.dart';

class CrewNotifier extends StateNotifier<List<CrewMember>> {
  CrewNotifier() : super([
    const CrewMember(id: '1', name: 'Chief Officer', rank: 'CHIEF', watchSchedule: '04:00 - 08:00 / 16:00 - 20:00', isOnWatch: true),
    const CrewMember(id: '2', name: 'Electrical Engineer', rank: 'ETO', watchSchedule: 'Day Worker', isOnWatch: false),
    const CrewMember(id: '3', name: 'Assistant ETO', rank: 'ETO12', watchSchedule: 'Day Worker', isOnWatch: false),
    const CrewMember(id: '4', name: 'Able Seaman', rank: 'AB', watchSchedule: '00:00 - 04:00 / 12:00 - 16:00', isOnWatch: false),
  ]);

  void toggleWatch(String id) {
    state = [
      for (final member in state)
        if (member.id == id) member.copyWith(isOnWatch: !member.isOnWatch) else member
    ];
  }

  void addMember(CrewMember member) {
    state = [...state, member];
  }
}

final crewProvider = StateNotifierProvider<CrewNotifier, List<CrewMember>>((ref) {
  return CrewNotifier();
});
