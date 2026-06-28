import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'sidebar_item.dart';
import 'user_profile_card.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sidebar,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "AdStacks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              const UserProfileCard(),

              const SizedBox(height: 30),

              const SidebarItem(
                icon: Icons.home_rounded,
                title: "Home",
                selected: true,
              ),

              const SidebarItem(
                icon: Icons.people_alt_rounded,
                title: "Employees",
              ),

              const SidebarItem(
                icon: Icons.fact_check_outlined,
                title: "Attendance",
              ),

              const SidebarItem(
                icon: Icons.bar_chart_rounded,
                title: "Summary",
              ),

              const SidebarItem(
                icon: Icons.info_outline,
                title: "Information",
              ),

              const SizedBox(height: 30),

              const Text(
                "WORKSPACES",
                style: TextStyle(
                  color: Colors.white54,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 15),

              const SidebarItem(
                icon: Icons.workspaces_outline,
                title: "AdStacks",
              ),

              const SidebarItem(
                icon: Icons.account_balance_wallet_outlined,
                title: "Finance",
              ),

              const SizedBox(height: 35),

              const Divider(
                color: Colors.white24,
                thickness: 1,
              ),

              const SizedBox(height: 15),

              const SidebarItem(
                icon: Icons.settings,
                title: "Settings",
              ),

              const SidebarItem(
                icon: Icons.logout,
                title: "Logout",
              ),
            ],
          ),
        ),
      ),
    );
  }
}