import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/main_screen.dart';
import '../../../theme/app_theme.dart';
import 'action_button.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Actions', style: AppTheme.headingSmall),
        const SizedBox(height: 16),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ActionButton(
                  label: 'Live Tracking',
                  icon: Icons.location_on,
                  color: AppTheme.primaryBlue,
                  onTap: () {
                    // Navigate to live tracking
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => MainScreen(currentIndex: 1),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ActionButton(
                  label: 'Reports',
                  icon: Icons.assessment,
                  color: AppTheme.accentPurple,
                  onTap: () {
                    // Navigate to reports
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => MainScreen(currentIndex: 3),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
