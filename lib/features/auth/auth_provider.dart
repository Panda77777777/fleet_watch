import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fleet_watch/features/auth/user_model.dart';

class AuthState {
  final UserModel? user;
  final bool isLoading;

  AuthState({this.user, this.isLoading = false});

  bool get isLoggedIn => user != null;
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  Future<void> login(String email, String password) async {
    state = AuthState(isLoading: true);
    await Future.delayed(const Duration(seconds: 1));
    state = AuthState(
      user: UserModel(
        id: '1',
        email: email,
        name: 'Моряк',
        role: UserRole.seaman,
      ),
    );
  }

  Future<void> register(String email, String password, String name, UserRole role) async {
    state = AuthState(isLoading: true);
    await Future.delayed(const Duration(seconds: 1));
    state = AuthState(
      user: UserModel(
        id: '2',
        email: email,
        name: name,
        role: role,
      ),
    );
  }

  void logout() {
    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
