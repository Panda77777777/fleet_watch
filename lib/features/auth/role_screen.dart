import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/models.dart';
import 'auth_state.dart';

class RoleScreen extends ConsumerStatefulWidget {
  const RoleScreen({super.key});

  @override
  ConsumerState<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends ConsumerState<RoleScreen> {
  UserRole _selectedRole = UserRole.seafarer;
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FleetWatch - Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Your Role',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SegmentedButton<UserRole>(
              segments: const [
                ButtonSegment(value: UserRole.seafarer, label: Text('Seafarer'), icon: Icon(Icons.person)),
                ButtonSegment(value: UserRole.crewing, label: Text('Crewing Agency'), icon: Icon(Icons.business)),
              ],
              selected: {_selectedRole},
              onSelectionChanged: (Set<UserRole> newSelection) {
                setState(() => _selectedRole = newSelection.first);
              },
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              onPressed: () {
                final email = _emailController.text.trim();
                if (email.isNotEmpty) {
                  ref.read(authStateProvider.notifier).login(
                    UserProfile(
                      id: DateTime.now().toString(),
                      email: email,
                      role: _selectedRole,
                      name: _selectedRole == UserRole.seafarer ? 'John Doe' : 'Sea Star Crewing',
                    ),
                  );
                }
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
