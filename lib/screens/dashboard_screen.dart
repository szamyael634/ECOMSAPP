import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';

  final AuthService authService;

  const DashboardScreen({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    final userEmail = authService.currentUser?.email ?? 'Unknown user';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: () async {
              await authService.signOut();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Welcome to ECOMS Dashboard', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              Text('Logged in as: $userEmail'),
            ],
          ),
        ),
      ),
    );
  }
}
