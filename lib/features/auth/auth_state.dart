import 'package:flutter_riverpod/flutter_riverpod.dart';

enum UserRole { seafarer, crewing }

class Session {
  final String? email;
  final UserRole? role;
  final Set<String> ranks;

  const Session({this.email, this.role, this.ranks = const {}});

  bool get loggedIn => email != null;

  Session copyWith({UserRole? role, Set<String>? ranks}) => Session(
        email: email,
        role: role ?? this.role,
        ranks: ranks ?? this.ranks,
      );
}

class SessionNotifier extends Notifier<Session> {
  @override
  Session build() => const Session();

  void login(String email) => state = Session(email: email);

  void setRole(UserRole role) => state = state.copyWith(role: role);

  void toggleRank(String rank) {
    final next = {...state.ranks};
    if (!next.remove(rank)) next.add(rank);
    state = state.copyWith(ranks: next);
  }

  void logout() => state = const Session();
}

final sessionProvider =
    NotifierProvider<SessionNotifier, Session>(SessionNotifier.new);
