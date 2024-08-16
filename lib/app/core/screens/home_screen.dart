import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragament_tech_solutions_assignment/app/core/app_icons/AppIcons.dart';

import '../app_routes/AppRoutes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Column(
            children: [
              Expanded(child: Image.asset(
                AppIcon.logo, // Use a suitable image URL
                fit: BoxFit.cover,
              )),

              Expanded(child: Image.asset(
                AppIcon.logo, // Use a suitable image URL
                fit: BoxFit.cover,
              )),
              Expanded(child: Image.asset(
                AppIcon.logo, // Use a suitable image URL
                fit: BoxFit.cover,
              )),
              Expanded(child: Image.asset(
                AppIcon.logo, // Use a suitable image URL
                fit: BoxFit.cover,
              )),
              Expanded(child: Image.asset(
                AppIcon.logo, // Use a suitable image URL
                fit: BoxFit.cover,
              )),
            ],
          ),
          // Gradient overlay
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Center content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  'Welcome to the Home Screen',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.6),
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Card with button
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Center(
                          child: Text(
                            'Explore Monthly Crude Oil Processed Charts',
                            textAlign: TextAlign.center, // Ensures text is centered within the available space
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple, // Button color
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => context.go(AppRoutes.CHART_SCREEN),
                          child: const Text('Go to Chart',style: TextStyle(
                            color: Colors.white
                          ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
