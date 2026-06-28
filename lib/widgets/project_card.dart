import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        "title": "Technology behind Blockchain",
        "color": Colors.deepPurple,
        "progress": .85,
      },
      {
        "title": "AI Powered Analytics",
        "color": Colors.orange,
        "progress": .65,
      },
      {
        "title": "Employee Management",
        "color": Colors.green,
        "progress": .45,
      },
      {
        "title": "Cloud Infrastructure",
        "color": Colors.blue,
        "progress": .90,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "All Projects",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          ...projects.map(
                (project) => Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: _ProjectTile(
                title: project["title"] as String,
                color: project["color"] as Color,
                progress: project["progress"] as double,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectTile extends StatelessWidget {
  final String title;
  final Color color;
  final double progress;

  const _ProjectTile({
    required this.title,
    required this.color,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.04),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(.15),
            child: Icon(
              Icons.folder,
              color: color,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.white10,
                    valueColor:
                    AlwaysStoppedAnimation(color),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Text(
            "${(progress * 100).toInt()}%",
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}