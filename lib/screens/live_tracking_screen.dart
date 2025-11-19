import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';
import '../data/mock_data.dart';
import '../models/vehicle.dart';
import '../widgets/status_badge.dart';

class LiveTrackingScreen extends StatefulWidget {
  const LiveTrackingScreen({Key? key}) : super(key: key);

  @override
  State<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends State<LiveTrackingScreen> {
  Vehicle? selectedVehicle;
  List<Vehicle> vehicles = [];

  @override
  void initState() {
    super.initState();
    vehicles = MockData.getVehicles();
    if (vehicles.isNotEmpty) {
      selectedVehicle = vehicles.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MobileHeader(
        title: 'Live Tracking',
        subtitle: 'Real-time vehicle tracking',
        showBackButton: true,
        canGoBack: true,
      ),
      body: Column(
        children: [
          // Map Placeholder
          Expanded(
            flex: 3,
            child: Container(
              color: AppColors.secondary,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map_rounded,
                          size: 64,
                          color: AppColors.textMuted,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Live Map View',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Real-time vehicle positions',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Map Controls
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Column(
                      children: [
                        FloatingActionButton(
                          mini: true,
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          child: Icon(Icons.add, color: AppColors.primary),
                        ),
                        const SizedBox(height: 8),
                        FloatingActionButton(
                          mini: true,
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          child: Icon(Icons.remove, color: AppColors.primary),
                        ),
                        const SizedBox(height: 8),
                        FloatingActionButton(
                          mini: true,
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          child: Icon(Icons.my_location, color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Vehicle Details Panel
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Vehicle Selector
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.border),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<Vehicle>(
                            value: selectedVehicle,
                            decoration: const InputDecoration(
                              labelText: 'Select Vehicle',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                            ),
                            items: vehicles.map((vehicle) {
                              return DropdownMenuItem(
                                value: vehicle,
                                child: Text(vehicle.plateNumber),
                              );
                            }).toList(),
                            onChanged: (vehicle) {
                              setState(() {
                                selectedVehicle = vehicle;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        IconButton(
                          onPressed: () {
                            // Refresh tracking
                          },
                          icon: Icon(Icons.refresh, color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),

                  // Vehicle Info
                  if (selectedVehicle != null)
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedVehicle!.plateNumber,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${selectedVehicle!.make} ${selectedVehicle!.model}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                                StatusBadge.status(
                                  selectedVehicle!.status.toString(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildInfoRow(
                              icon: Icons.person,
                              label: 'Driver',
                              value: selectedVehicle!.driver,
                            ),
                            _buildInfoRow(
                              icon: Icons.location_on,
                              label: 'Location',
                              value: selectedVehicle!.lastLocation,
                            ),
                            if (selectedVehicle!.speed != null)
                              _buildInfoRow(
                                icon: Icons.speed,
                                label: 'Speed',
                                value: '${selectedVehicle!.speed} km/h',
                              ),
                            if (selectedVehicle!.fuelLevel != null)
                              _buildInfoRow(
                                icon: Icons.local_gas_station,
                                label: 'Fuel Level',
                                value: '${selectedVehicle!.fuelLevel}%',
                                valueColor: AppColors.getFuelColor(
                                  selectedVehicle!.fuelLevel!,
                                ),
                              ),
                            if (selectedVehicle!.mileage != null)
                              _buildInfoRow(
                                icon: Icons.route,
                                label: 'Mileage',
                                value: '${selectedVehicle!.mileage} KMs',
                              ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // Call driver
                                    },
                                    icon: const Icon(Icons.phone, size: 18),
                                    label: const Text('Call Driver'),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: () {
                                      // View trip history
                                    },
                                    icon: const Icon(Icons.history, size: 18),
                                    label: const Text('Trip History'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: AppColors.textSecondary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: valueColor ?? AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
