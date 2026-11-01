import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/auth_state.dart';
import 'features/auth/role_screen.dart';
import 'features/home/home_shell.dart';
import 'features/vacancies/screens/vacancy_list_screen.dart';
import 'features/vacancies/screens/create_vacancy_screen.dart';
import 'features/crewing/screens/crewing_reviews_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = authState != null;
      final isLoggingIn = state.uri.path == '/auth';

      if (!isLoggedIn && !isLoggingIn) return '/auth';
      if (isLoggedIn && isLoggingIn) return '/';
      return null;
    },
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) => const RoleScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeShell(),
        routes: [
          GoRoute(
            path: 'vacancies',
            builder: (context, state) => const VacancyListScreen(),
          ),
          GoRoute(
            path: 'reviews',
            builder: (context, state) => const CrewingReviewsScreen(),
          ),
          GoRoute(
            path: 'create-vacancy',
            builder: (context, state) => const CreateVacancyScreen(),
          ),
        ],
      ),
    ],
  );
});
