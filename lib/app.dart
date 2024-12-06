import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/main_screen.dart';
import 'screens/login_screen.dart';
import 'providers/auth_provider.dart';
import 'theme2/app_theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return MaterialApp(
      title: 'Doctor Appointment App',
      theme: AppTheme.lightTheme,
      home: authState.isAuthenticated ? const MainScreen() : LoginScreen(),
    );
  }
}
