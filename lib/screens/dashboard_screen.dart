import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/main_screen.dart';
import 'package:intrack_customer/screens/report_vehicle_details.dart';
import 'package:provider/provider.dart';
import '../providers/vehicle_provider.dart';
import '../providers/driver_provider.dart';
import '../theme/app_theme.dart';

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
              title: Image.asset("assets/intrack_header.png",fit: BoxFit.cover, height: 25,),
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
                  _buildStatsSection(context),
                  
                  const SizedBox(height: 24),
                  
                  // Quick Actions
                  _buildQuickActions(context),
                  
                  // const SizedBox(height: 24),
                  
                  // Today's Summary
                  // _buildTodaySummary(context),
                  
                  // const SizedBox(height: 24),
                  
                  // Recent Activity
                  _buildRecentActivity(context),
                  
                  const SizedBox(height: 80),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Consumer2<VehicleProvider, DriverProvider>(
      builder: (context, vehicleProvider, driverProvider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fleet Overview',
              style: AppTheme.headingSmall,
            ),
            const SizedBox(height: 16),
            
            // Main KM Card
            Container(
              decoration: AppTheme.gradientCardDecoration,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.speed,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Today\'s Distance',
                        style: AppTheme.bodyMedium.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${vehicleProvider.getTodayTotalKm().toStringAsFixed(1)} KM',
                    style: AppTheme.headingLarge.copyWith(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.trending_up,
                        color: Colors.greenAccent,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '12% from yesterday',
                        style: AppTheme.bodySmall.copyWith(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Stats Grid
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Vehicles',
                    vehicleProvider.totalVehicles.toString(),
                    Icons.local_shipping,
                    AppTheme.primaryBlue,
                    '${vehicleProvider.activeVehicles} Active',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Drivers',
                    driverProvider.totalDrivers.toString(),
                    Icons.people,
                    AppTheme.accentGreen,
                    '${driverProvider.activeDrivers} Active',
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Active Now',
                    vehicleProvider.activeVehicles.toString(),
                    Icons.gps_fixed,
                    AppTheme.success,
                    'Moving',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Idle',
                    vehicleProvider.idleVehicles.toString(),
                    Icons.pause_circle,
                    AppTheme.warning,
                    'Stopped',
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    return Container(
      decoration: AppTheme.cardDecoration,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  subtitle,
                  style: AppTheme.caption.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: AppTheme.headingLarge.copyWith(
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.textGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: AppTheme.headingSmall,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                'Live Tracking',
                Icons.location_on,
                AppTheme.primaryBlue,
                () {
                  // Navigate to live tracking
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>  MainScreen(currentIndex: 1),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildActionButton(
                'Reports',
                Icons.assessment,
                AppTheme.accentPurple,
                () {
                  // Navigate to reports
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>  MainScreen(currentIndex: 3),
                    ),
                  );
                },
              ),
            ),
           
          ],
        ),
        const SizedBox(height: 12),
        // Row(
        //   children: [
        //     Expanded(
        //       child: _buildActionButton(
        //         'Add Driver',
        //         Icons.person_add,
        //         AppTheme.accentOrange,
        //         () {
        //           // Navigate to add driver
        //         },
        //       ),
        //     ),
        //     const SizedBox(width: 12),
        //      Expanded(
        //       child: _buildActionButton(
        //         'Add Vehicle',
        //         Icons.add_circle,
        //         AppTheme.accentGreen,
        //         () {
        //           // Navigate to add vehicle
        //         },
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget _buildActionButton(
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: AppTheme.bodyMedium.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodaySummary(BuildContext context) {
    return Container(
      decoration: AppTheme.cardDecoration,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today\'s Summary',
                style: AppTheme.headingSmall,
              ),
              Text(
                'Nov 20, 2025',
                style: AppTheme.bodySmall.copyWith(
                  color: AppTheme.textGray,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSummaryRow(
            'Total Trips',
            '24',
            Icons.route,
            AppTheme.primaryBlue,
          ),
          const Divider(height: 24),
          _buildSummaryRow(
            'Average Speed',
            '52 km/h',
            Icons.speed,
            AppTheme.accentGreen,
          ),
          const Divider(height: 24),
          _buildSummaryRow(
            'Fuel Consumed',
            '145 L',
            Icons.local_gas_station,
            AppTheme.accentOrange,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: AppTheme.bodyMedium,
          ),
        ),
        Text(
          value,
          style: AppTheme.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Activity',
              style: AppTheme.headingSmall,
            ),
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
        _buildActivityItem(
          'MH 12 AB 1234',
          'Shree Ram Nagar, Anand, Gujarat, India 388001',
          '5 mins ago',
          Icons.play_circle,
          AppTheme.accentGreen,
          context
        ),
        _buildActivityItem(
          'DL 01 CD 5678',
          'India Gate, New Delhi, India',
          '23 mins ago',
          Icons.check_circle,
          AppTheme.success,
          context
        ),
        _buildActivityItem(
          'KA 03 EF 9012',
          'Shree Ram Nagar, Anand, Gujarat, India 388001',
          '2 hours ago',
          Icons.warning,
          AppTheme.warning,
          context
        ),
        
      ],
    );
  }

  Widget _buildActivityItem(
    String title,
    String subtitle,
    String time,
    IconData icon,
    Color color,
    BuildContext context
  ) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  VehicleTrackingScreen(),
                    ),
                  );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: AppTheme.cardDecoration,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTheme.bodySmall.copyWith(
                      color: AppTheme.textGray,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              time,
              style: AppTheme.caption.copyWith(
                color: AppTheme.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
