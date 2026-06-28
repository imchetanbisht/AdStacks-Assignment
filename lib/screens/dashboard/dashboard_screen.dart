import 'package:flutter/material.dart';
import '../../widgets/project_card.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/top_creators_card.dart';
import '../../widgets/hero_banner.dart';
import '../../widgets/sidebar/sidebar.dart';
import '../../widgets/right_panel.dart';
import '../../widgets/performance_chart.dart';
import '../../widgets/top_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final bool isMobile = width < 700;
        final bool isTablet = width >= 700 && width < 1100;
        final bool isDesktop = width >= 1100;

        return Scaffold(
          backgroundColor: AppColors.background,

          drawer: isMobile
              ? const Drawer(
            backgroundColor: AppColors.sidebar,
            child: SafeArea(
              child: Sidebar(),
            ),
          )
              : null,

          body: SafeArea(
            child: Row(
              children: [
                if (!isMobile)
                  SizedBox(
                    width: isTablet ? 220 : 280,
                    child: const Sidebar(),
                  ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isMobile)
                          Row(
                            children: [
                              Builder(
                                builder: (context) => IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  icon: const Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TopBar(
                                  isMobile: true,
                                ),
                              ),
                            ],
                          )
                        else
                          TopBar(
                            isMobile: false,
                          ),

                        const SizedBox(height: 30),

                        const HeroBanner(),

                        const SizedBox(height: 30),

                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            SizedBox(
                              width: isMobile
                                  ? double.infinity
                                  : isTablet
                                  ? (width - 320) / 2
                                  : 420,
                              child: const ProjectCard(),
                            ),
                            SizedBox(
                              width: isMobile
                                  ? double.infinity
                                  : isTablet
                                  ? (width - 320) / 2
                                  : 420,
                              child: const TopCreatorsCard(),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        const SizedBox(
                          height: 320,
                          child: PerformanceChart(),
                        ),

                        if (!isDesktop) ...[
                          const SizedBox(height: 25),

                          const CalendarCard(),

                          const SizedBox(height: 20),

                          const BirthdayCard(),

                          const SizedBox(height: 20),

                          const AnniversaryCard(),
                        ],
                      ],
                    ),
                  ),
                ),

                if (isDesktop)
                  Container(
                    width: 330,
                    color: AppColors.sidebar,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildCard(
                          "Calendar",
                          height: 220,
                        ),

                        const SizedBox(height: 20),

                        _buildCard("Birthday"),

                        const SizedBox(height: 20),

                        _buildCard("Anniversary"),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildCard(
      String title, {
        double height = 180,
      }) {
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}