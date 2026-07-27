import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/vehicle_provider.dart';
import '../../../providers/driver_provider.dart';
import '../../../providers/dashboard_provider.dart';
import '../../../theme/app_theme.dart';
import 'stat_card.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<VehicleProvider, DriverProvider, DashboardProvider>(
      builder: (context, vehicleProvider, driverProvider, dashboardProvider, _) {
        // Debug logging to verify the values receiving from providers
        debugPrint('--- StatsSection Debug ---');
        debugPrint('DashboardProvider: totalVehicles=${dashboardProvider.totalVehicles}, totalDrivers=${dashboardProvider.totalDrivers}, isLoading=${dashboardProvider.isLoading}');
        debugPrint('VehicleProvider: listLength=${vehicleProvider.vehicles.length}, active=${vehicleProvider.activeVehicles}, idle=${vehicleProvider.idleVehicles}, inactive=${vehicleProvider.inactiveVehicles}');
        debugPrint('VehicleProvider: todayTotalKm=${vehicleProvider.getTodayTotalKm()}');
        debugPrint('--------------------------');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fleet Overview', style: AppTheme.headingSmall),
                if (dashboardProvider.isLoading || vehicleProvider.isLoading)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
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
                        child: const Icon(Icons.speed, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Today\'s Distance',
                        style: AppTheme.bodyMedium.copyWith(color: Colors.white.withOpacity(0.9)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${vehicleProvider.getTodayTotalKm().toStringAsFixed(1)} KM',
                    style: AppTheme.headingLarge.copyWith(fontSize: 36, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.trending_up, color: Colors.greenAccent, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '12% from yesterday',
                        style: AppTheme.bodySmall.copyWith(color: Colors.white.withOpacity(0.8)),
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
                  child: StatCard(
                    title: 'Vehicles',
                    value: dashboardProvider.totalVehicles.toString(),
                    icon: Icons.local_shipping,
                    color: AppTheme.primaryBlue,
                    subtitle: '${vehicleProvider.activeVehicles} Active',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Drivers',
                    value: dashboardProvider.totalDrivers.toString(),
                    icon: Icons.people,
                    color: AppTheme.accentGreen,
                    subtitle: '${driverProvider.activeDrivers} Active',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Active Now',
                    value: vehicleProvider.activeVehicles.toString(),
                    icon: Icons.gps_fixed,
                    color: AppTheme.success,
                    subtitle: 'Moving',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Idle',
                    value: vehicleProvider.idleVehicles.toString(),
                    icon: Icons.pause_circle,
                    color: AppTheme.warning,
                    subtitle: 'Stopped',
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
