import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class TopBar extends StatelessWidget {
  final bool isMobile;

  const TopBar({
    super.key,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "Home",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        if (!isMobile)
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 280,
              ),
              child: SizedBox(
                height: 48,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(color: Colors.white54),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white54,
                    ),
                    filled: true,
                    fillColor: AppColors.card,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: AppColors.purple,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

        if (isMobile) ...[
          const SizedBox(width: 10),
          _icon(Icons.search),
        ],

        const SizedBox(width: 12),

        _icon(Icons.notifications_none),

        const SizedBox(width: 12),

        _icon(Icons.calendar_today_outlined),

        const SizedBox(width: 12),

        const CircleAvatar(
          radius: 20,
          backgroundImage:
          NetworkImage("https://i.pravatar.cc/150?img=8"),
        ),
      ],
    );
  }

  Widget _icon(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}