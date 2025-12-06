import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/oauth/auth_controller_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key, this.from});

  final String? from;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: switch (authState) {
          AsyncData(:final value) when value == true => const Text(
            'Already logged in. Redirecting...',
          ),
          AsyncLoading() => const CircularProgressIndicator(),
          AsyncError(:final error, :final stackTrace) => Text('Error: $error'),
          _ => ElevatedButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).signIn();
            },
            child: const Text('Sign in with Logto'),
          ),
        },
      ),
    );
  }
}
