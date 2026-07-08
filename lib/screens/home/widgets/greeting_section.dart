import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person,
            color: AppColors.primary,
            size: 30,
          ),
        ),

        const SizedBox(width: 15),

        // Greeting
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning 👋",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Farah Mukti",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // Notification
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}