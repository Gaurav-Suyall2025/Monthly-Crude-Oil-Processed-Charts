import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter package
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod package
import 'app/core/screens/chart_screen.dart';
import 'app/core/screens/home_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/chart',
          builder: (context, state) => ChartScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}
