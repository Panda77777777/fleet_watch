class CrewMember {
  final String id;
  final String name;
  final String rank;
  final String watchSchedule;
  final bool isOnWatch;

  const CrewMember({
    required this.id,
    required this.name,
    required this.rank,
    required this.watchSchedule,
    this.isOnWatch = false,
  });

  CrewMember copyWith({
    String? id,
    String? name,
    String? rank,
    String? watchSchedule,
    bool? isOnWatch,
  }) {
    return CrewMember(
      id: id ?? this.id,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      watchSchedule: watchSchedule ?? this.watchSchedule,
      isOnWatch: isOnWatch ?? this.isOnWatch,
    );
  }
}
