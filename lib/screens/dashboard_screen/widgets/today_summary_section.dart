import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import 'summary_row.dart';

class TodaySummarySection extends StatelessWidget {
  const TodaySummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.cardDecoration,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today\'s Summary', style: AppTheme.headingSmall),
              Text(
                'Nov 20, 2025',
                style: AppTheme.bodySmall.copyWith(color: AppTheme.textGray),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SummaryRow(
            label: 'Total Trips',
            value: '24',
            icon: Icons.route,
            color: AppTheme.primaryBlue,
          ),
          const Divider(height: 24),
          SummaryRow(
            label: 'Average Speed',
            value: '52 km/h',
            icon: Icons.speed,
            color: AppTheme.accentGreen,
          ),
          const Divider(height: 24),
          SummaryRow(
            label: 'Fuel Consumed',
            value: '145 L',
            icon: Icons.local_gas_station,
            color: AppTheme.accentOrange,
          ),
        ],
      ),
    );
  }
}
