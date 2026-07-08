import 'package:flutter/material.dart';

import 'screens/auth/login_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const BeaKitaApp());
}

class BeaKitaApp extends StatelessWidget {
  const BeaKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BeaKita',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}