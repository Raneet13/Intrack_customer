import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/dashboard_provider.dart';
import '../../theme/app_theme.dart';
import '../notifications_screen/notifications_screen.dart';
import 'widgets/stats_section.dart';
import 'widgets/quick_actions_section.dart';
import 'widgets/recent_activity_section.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshData();
    });
  }

  Future<void> _refreshData() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final dashboardProvider = Provider.of<DashboardProvider>(context, listen: false);
    
    if (authProvider.userId != null) {
      await dashboardProvider.fetchDashboardData(authProvider.userId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
                      );
                    },
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
      ),
    );
  }
}
