import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme/app_theme.dart';
import 'screens/auth/login_page.dart';
import 'providers/scholarship_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ScholarshipProvider(),
      child: const BeaKitaApp(),
    ),
  );
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