import 'package:flutter/material.dart';
import 'package:intrack_customer/providers/auth_provider.dart';
import 'package:intrack_customer/screens/add_vehicle_screen.dart';
import 'package:intrack_customer/screens/track_vehicle_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/vehicle_provider.dart';
import '../../models/vehicle.dart';
import 'widgets/vehicles_header_widget.dart';

class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key});

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch vehicles when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final userId = authProvider.userId ?? '';
      
      debugPrint('🔍 [VehiclesScreen] Retrieved UserId from AuthProvider: "$userId"');
      debugPrint('🔍 [VehiclesScreen] Auth status: ${authProvider.isAuthenticated}');
      
      if (userId.isEmpty) {
        debugPrint('⚠️ [VehiclesScreen] WARNING: UserId is empty! API call might fail or return nothing.');
      }
      
      Provider.of<VehicleProvider>(context, listen: false).fetchVehicles(userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicles'),
      ),
      body: Consumer<VehicleProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading && provider.vehicles.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null && provider.vehicles.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(provider.errorMessage!, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final userId = Provider.of<AuthProvider>(context, listen: false).userId ?? '';
                      provider.fetchVehicles(userId);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              final userId = Provider.of<AuthProvider>(context, listen: false).userId ?? '';
              await provider.fetchVehicles(userId);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  VehiclesHeaderWidget(
                    activeCount: provider.activeVehicles,
                    idleCount: provider.idleVehicles,
                    onSearch: (query) {
                      // Implement search logic if needed
                    },
                  ),
                  provider.vehicles.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              const Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey),
                              const SizedBox(height: 16),
                              const Text(
                                'No vehicles found',
                                style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'It looks like there are no vehicles associated with your account.',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton.icon(
                                onPressed: () {
                                  final userId = Provider.of<AuthProvider>(context, listen: false).userId ?? '';
                                  provider.fetchVehicles(userId);
                                },
                                icon: const Icon(Icons.refresh),
                                label: const Text('Check Again'),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(16),
                          itemCount: provider.vehicles.length,
                          itemBuilder: (context, index) {
                            return _buildVehicleCard(context, provider.vehicles[index]);
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildVehicleCard(BuildContext context, Vehicle vehicle) {
    final bool isActive = vehicle.status == '1' || vehicle.status == 'active';

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xffEAF2FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.local_shipping,
                  color: Color(0xff3B73F0),
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicle.registrationNo,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${vehicle.name} (${vehicle.type})",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  isActive ? "Active" : "Inactive",
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.person, size: 20, color: Colors.black54),
              const SizedBox(width: 6),
              Text(
                vehicle.driverName.isEmpty ? "No Driver" : vehicle.driverName,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
              ),
              if (vehicle.driverPhone.isNotEmpty) ...[
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xffEAF2FF),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(Icons.call, color: Color(0xff3B73F0), size: 18),
                ),
              ],
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.location_on, size: 20, color: Colors.black54),
              const SizedBox(width: 6),
              Text(
                vehicle.lastLocation,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Subscription/Device Box
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xffFAFAFF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Device Status", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                    Text(
                      vehicle.deviceInstalled ? "Installed" : "Not Installed",
                      style: TextStyle(
                        color: vehicle.deviceInstalled ? Colors.green : Colors.orange,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (vehicle.deviceInstalled && vehicle.deviceDetails != null) ...[
                  const SizedBox(height: 10),
                  Text("IMEI: ${vehicle.deviceDetails?.imeiNo ?? 'N/A'}", style: const TextStyle(fontSize: 12)),
                  Text("Model: ${vehicle.deviceDetails?.deviceModel ?? 'N/A'}", style: const TextStyle(fontSize: 12)),
                ]
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrackVehicleScreen(vehicle: vehicle)),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.navigation, size: 18),
                          SizedBox(width: 6),
                          Text("Track"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddVehicleScreen(editingVehicle: vehicle)),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit, size: 18),
                          SizedBox(width: 6),
                          Text("Edit"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
