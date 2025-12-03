import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'widgets/stats_section.dart';
import 'widgets/quick_actions_section.dart';
import 'widgets/recent_activity_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Image.asset(
                "assets/intrack_header.png",
                fit: BoxFit.cover,
                height: 25,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  color: AppTheme.textDark,
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
              ],
            ),

            // Content
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Stats Overview
                  const StatsSection(),

                  const SizedBox(height: 24),

                  // Quick Actions
                  const QuickActionsSection(),

                  // Recent Activity
                  const RecentActivitySection(),

                  const SizedBox(height: 80),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
