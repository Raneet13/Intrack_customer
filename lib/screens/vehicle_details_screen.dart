import 'package:flutter/material.dart';
import '../models/vehicle.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';
import '../widgets/status_badge.dart';

class VehicleDetailsScreen extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleDetailsScreen({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileHeader(
         canGoBack: true,
        title: vehicle.plateNumber,
        subtitle: '${vehicle.make} ${vehicle.model}',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    StatusBadge.status(vehicle.status.toString()),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Vehicle Information
            const Text(
              'Vehicle Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoRow('Type', vehicle.type),
                    _buildInfoRow('Make', vehicle.make),
                    _buildInfoRow('Model', vehicle.model),
                    _buildInfoRow('Year', vehicle.year.toString()),
                    if (vehicle.mileage != null)
                      _buildInfoRow('Mileage', '${vehicle.mileage} KMs'),
                    if (vehicle.lastLocation != null)
                      _buildInfoRow('Last Service', vehicle.lastLocation!),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Driver Information
            const Text(
              'Driver Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoRow('Driver', vehicle.driverName),
                    _buildInfoRow('Phone', vehicle.driverPhone),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Current Location
            const Text(
              'Current Location',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoRow('Location', vehicle.lastLocation),
                    if (vehicle.speed != null)
                      _buildInfoRow('Speed', '${vehicle.speed} km/h'),
                    if (vehicle.fuelLevel != null)
                      _buildInfoRow('Fuel Level', '${vehicle.fuelLevel}%'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Action Buttons
            ElevatedButton.icon(
              onPressed: () {
                // Track vehicle
              },
              icon: const Icon(Icons.navigation),
              label: const Text('Track Vehicle'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {
                // View trip history
              },
              icon: const Icon(Icons.history),
              label: const Text('View Trip History'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
