import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_state.dart';

class RoleScreen extends ConsumerWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(sessionProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Кто вы?')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.sailing, size: 36),
              title: const Text('Моряк'),
              subtitle:
                  const Text('Ищу работу, оставляю отзывы о крюингах'),
              onTap: () => notifier.setRole(UserRole.seafarer),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.business, size: 36),
              title: const Text('Крюинг'),
              subtitle:
                  const Text('Публикую вакансии, получаю отклики и рейтинг'),
              onTap: () => notifier.setRole(UserRole.crewing),
            ),
          ),
        ],
      ),
    );
  }
}
