import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/live_tracking_screen.dart';
import 'package:intrack_customer/screens/track_vehicle_screen.dart';
import '../models/vehicle.dart';
import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';
import '../widgets/status_badge.dart';
import 'add_vehicle_screen.dart';
import 'vehicle_details_screen.dart';

class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({Key? key}) : super(key: key);

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  List<Vehicle> vehicles = [];
  String searchQuery = '';
  String statusFilter = 'All';

  @override
  void initState() {
    super.initState();
    vehicles = MockData.getVehicles();
  }

  List<Vehicle> get filteredVehicles {
    return vehicles.where((vehicle) {
      final matchesSearch = vehicle.plateNumber
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          vehicle.driver.toLowerCase().contains(searchQuery.toLowerCase()) ||
          vehicle.make.toLowerCase().contains(searchQuery.toLowerCase()) ||
          vehicle.model.toLowerCase().contains(searchQuery.toLowerCase());

      final matchesStatus =
          statusFilter == 'All' || vehicle.status.toString() == statusFilter;

      return matchesSearch && matchesStatus;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final activeCount = vehicles.where((v) => v.status == VehicleStatus.active).length;
    final maintenanceCount = vehicles.where((v) => v.status == VehicleStatus.maintenance).length;
    final inactiveCount = vehicles.where((v) => v.status == VehicleStatus.inactive).length;

    return Scaffold(
      appBar: MobileHeader(
        title: 'Vehicle Fleet',
         canGoBack: true,
        subtitle: '${filteredVehicles.length} vehicles',
        rightAction: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddVehicleScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Add'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              textStyle: const TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search vehicles, drivers...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          // Status Filters
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildFilterChip('All'),
                _buildFilterChip('Active'),
                _buildFilterChip('Inactive'),
                _buildFilterChip('Maintenance'),
              ],
            ),
          ),

          // Stats Overview
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    label: 'Active',
                    value: activeCount.toString(),
                    color: AppColors.success,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    label: 'Maintenance',
                    value: maintenanceCount.toString(),
                    color: AppColors.warning,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    label: 'Inactive',
                    value: inactiveCount.toString(),
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Vehicle List
          Expanded(
            child: filteredVehicles.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredVehicles.length,
                    itemBuilder: (context, index) {
                      return _buildVehicleCard(filteredVehicles[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = statusFilter == label;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            statusFilter = label;
          });
        },
        backgroundColor: Colors.white,
        selectedColor: AppColors.primary,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String label,
    required String value,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleCard(Vehicle vehicle) {
    final vehicleIcon = vehicle.type == 'Truck'
        ? Icons.local_shipping_rounded
        : Icons.directions_car_rounded;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VehicleDetailsScreen(vehicle: vehicle),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      vehicleIcon,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              vehicle.plateNumber,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            StatusBadge.status(vehicle.status.toString()),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${vehicle.make} ${vehicle.model} (${vehicle.year})',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 14,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                vehicle.driver,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.phone, size: 16),
                              onPressed: () {
                                // Make phone call
                              },
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 14,
                                  color: AppColors.textSecondary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  vehicle.lastLocation,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                            if (vehicle.fuelLevel != null)
                              Row(
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: AppColors.getFuelColor(
                                          vehicle.fuelLevel!),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${vehicle.fuelLevel}%',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.getFuelColor(
                                          vehicle.fuelLevel!),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        if (vehicle.mileage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              'KMs: ${vehicle.mileage!.toString()} • Service: ${vehicle.lastService}',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Track vehicle
                         Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  TrackVehicleScreen(vehicle: vehicle,),
                        ),
                      );
                      },
                      icon: const Icon(Icons.navigation, size: 16),
                      label: const Text('Track'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Edit vehicle
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AddVehicleScreen(editingVehicle: vehicle,),
                        ),
                      );
                      },
                      icon: const Icon(Icons.edit, size: 16),
                      label: const Text('Edit'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () {
                      // Delete vehicle
                      _showDeleteDialog(vehicle);
                    },
                    child: const Icon(Icons.delete, size: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.directions_car_rounded,
            size: 64,
            color: AppColors.textMuted,
          ),
          const SizedBox(height: 16),
          Text(
            'No vehicles found',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search or filters',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(Vehicle vehicle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Vehicle'),
        content: Text('Are you sure you want to delete ${vehicle.plateNumber}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                vehicles.removeWhere((v) => v.id == vehicle.id);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${vehicle.plateNumber} deleted')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
