import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import 'activity_item.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Activity', style: AppTheme.headingSmall),
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
        ActivityItem(
          title: 'MH 12 AB 1234',
          subtitle: 'Shree Ram Nagar, Anand, Gujarat, India 388001',
          time: '5 mins ago',
          icon: Icons.play_circle,
          color: AppTheme.accentGreen,
        ),
        ActivityItem(
          title: 'DL 01 CD 5678',
          subtitle: 'India Gate, New Delhi, India',
          time: '23 mins ago',
          icon: Icons.check_circle,
          color: AppTheme.success,
        ),
        ActivityItem(
          title: 'KA 03 EF 9012',
          subtitle: 'Shree Ram Nagar, Anand, Gujarat, India 388001',
          time: '2 hours ago',
          icon: Icons.warning,
          color: AppTheme.warning,
        ),
      ],
    );
  }
}
