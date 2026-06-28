import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage:
            NetworkImage("https://i.pravatar.cc/150?img=8"),
          ),
          SizedBox(height: 12),
          Text(
            "Rohan Sharma",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Project Manager",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}