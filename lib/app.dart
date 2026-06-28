import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/dashboard/dashboard_screen.dart';

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AdStacks Dashboard",
      theme: AppTheme.light,
      home: const DashboardScreen(),
    );
  }
}