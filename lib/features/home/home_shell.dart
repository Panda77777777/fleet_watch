import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/models.dart';
import '../auth/auth_state.dart';

class HomeShell extends ConsumerWidget {
  const HomeShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);
    final isSeafarer = user?.role == UserRole.seafarer;

    return Scaffold(
      appBar: AppBar(
        title: Text(isSeafarer ? 'FleetWatch - Seafarer Portal' : 'FleetWatch - Crewing Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authStateProvider.notifier).logout(),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSeafarer ? Icons.anchor : Icons.business_center,
                size: 64,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome, ${user?.name ?? 'User'}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'Role: ${isSeafarer ? 'Seafarer' : 'Crewing Agency'}',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                onPressed: () => context.go('/vacancies'),
                icon: const Icon(Icons.list_alt),
                label: const Text('Browse Vacancies Feed'),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                onPressed: () => context.go('/reviews'),
                icon: const Icon(Icons.star_rate),
                label: const Text('Crewing Ratings & Reviews'),
              ),
              if (!isSeafarer) ...[
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => context.go('/create-vacancy'),
                  icon: const Icon(Icons.add),
                  label: const Text('Post New Vacancy'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
