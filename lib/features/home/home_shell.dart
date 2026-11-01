import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/data/ranks.dart';
import '../auth/auth_state.dart';

class _Tab {
  final String label;
  final IconData icon;
  final Widget page;
  const _Tab(this.label, this.icon, this.page);
}

class HomeShell extends ConsumerStatefulWidget {
  const HomeShell({super.key});

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionProvider);
    final isSeafarer = session.role == UserRole.seafarer;

    final tabs = isSeafarer
        ? const [
            _Tab('Вакансии', Icons.work_outline,
                _Placeholder('Лента вакансий')),
            _Tab('Крюинги', Icons.star_outline,
                _Placeholder('Рейтинг крюингов')),
            _Tab('Отклики', Icons.send_outlined,
                _Placeholder('Мои отклики')),
            _Tab('Профиль', Icons.person_outline, _SeafarerProfile()),
          ]
        : const [
            _Tab('Вакансии', Icons.work_outline,
                _Placeholder('Мои вакансии')),
            _Tab('Отклики', Icons.inbox_outlined,
                _Placeholder('Отклики моряков')),
            _Tab('Рейтинг', Icons.star_outline,
                _Placeholder('Рейтинг и отзывы')),
            _Tab('Профиль', Icons.business_outlined, _CrewingProfile()),
          ];

    return Scaffold(
      appBar: AppBar(title: Text(tabs[_index].label)),
      body: tabs[_index].page,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          for (final t in tabs)
            NavigationDestination(icon: Icon(t.icon), label: t.label),
        ],
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  final String text;
  const _Placeholder(this.text);

  @override
  Widget build(BuildContext context) =>
      Center(child: Text('$text\n(скоро)', textAlign: TextAlign.center));
}

class _SeafarerProfile extends ConsumerWidget {
  const _SeafarerProfile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final notifier = ref.read(sessionProvider.notifier);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(session.email ?? '',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        Text('Мои должности',
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final r in seafarerRanks)
              FilterChip(
                label: Text(r),
                selected: session.ranks.contains(r),
                onSelected: (_) => notifier.toggleRank(r),
              ),
          ],
        ),
        const SizedBox(height: 24),
        OutlinedButton(
            onPressed: notifier.logout, child: const Text('Выйти')),
      ],
    );
  }
}

class _CrewingProfile extends ConsumerWidget {
  const _CrewingProfile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(session.email ?? '',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        const Text('Профиль компании (скоро)'),
        const SizedBox(height: 24),
        OutlinedButton(
            onPressed: ref.read(sessionProvider.notifier).logout,
            child: const Text('Выйти')),
      ],
    );
  }
}
