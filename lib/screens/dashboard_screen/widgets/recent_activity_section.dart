import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/dashboard_provider.dart';
import '../../../theme/app_theme.dart';
import 'activity_item.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, _) {
        final activities = dashboardProvider.recentActivities;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Activity', style: AppTheme.headingSmall),
                if (activities.isNotEmpty)
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.primaryBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            if (dashboardProvider.isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (activities.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    Icon(Icons.history, color: Colors.grey.shade400, size: 40),
                    const SizedBox(height: 12),
                    Text(
                      'No recent activities found',
                      style: AppTheme.bodyMedium.copyWith(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return ActivityItem(
                    title: activity['title'] ?? 'Activity',
                    subtitle: activity['description'] ?? '',
                    time: activity['time'] ?? '',
                    icon: Icons.notifications_outlined,
                    color: AppTheme.primaryBlue,
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
