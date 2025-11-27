import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/report_vehicle_details.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';
import '../widgets/status_badge.dart';
import '../models/vehicle.dart';

class TrackVehicleScreen extends StatelessWidget {
  final Vehicle vehicle;

  const TrackVehicleScreen({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock location data
    final mockLocationData = {
      'currentLocation': 'NH-4 Pune-Mumbai Highway, Km 45',
      'coordinates': {'lat': 18.5204, 'lng': 73.8567},
      'speed': '65 km/h',
      'heading': 'Northeast',
      'lastUpdate': '2 mins ago',
      'route': 'Mumbai → Pune',
      'estimatedArrival': '45 mins',
      'distanceToDestination': '52 km'
    };

    final recentLocations = [
      {'time': '2 mins ago', 'location': 'NH-4 Pune-Mumbai Highway, Km 45', 'speed': '65 km/h'},
      {'time': '10 mins ago', 'location': 'Lonavala Toll Plaza', 'speed': '20 km/h'},
      {'time': '25 mins ago', 'location': 'Khandala Viewpoint', 'speed': '0 km/h'},
      {'time': '1 hour ago', 'location': 'Pune City Center', 'speed': '35 km/h'},
      {'time': '2 hours ago', 'location': 'Hadapsar Industrial Area', 'speed': '25 km/h'},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MobileHeader(
        title: 'Track Vehicle',
        
        subtitle: "MH12AB1234",
        canGoBack: true,
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Call driver
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  VehicleTrackingScreen(),
                    ),
                  );
              },
              icon: const Icon(Icons.route, size: 16),
              label: const Text('Reports'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                textStyle: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Map Placeholder
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      // Map view
                      Container(
                        height: 192,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.blue.shade100, Colors.green.shade100],
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 48,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Live Location',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    mockLocationData['currentLocation'] as String,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            // Vehicle pin
                            Center(
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade600,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Container(
                                    height: 6,
                                    width: 6,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Map actions
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.navigation, size: 16),
                                label: const Text('Directions'),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.share_location, size: 16),
                                label: const Text('Share Location'),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        
            
              // // Trip Information Card
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Card(
              //     child: Padding(
              //       padding: const EdgeInsets.all(16.0),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           const Row(
              //             children: [
              //               Icon(Icons.route, size: 20, color: Colors.black87),
              //               SizedBox(width: 8),
              //               Text(
              //                 'Current Trip',
              //                 style: TextStyle(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           const SizedBox(height: 16),
              //           _buildTripInfoRow('Route', mockLocationData['route'] as String),
              //           const SizedBox(height: 12),
              //           _buildTripInfoRow(
              //             'ETA',
              //             mockLocationData['estimatedArrival'] as String,
              //             valueColor: AppColors.success,
              //           ),
              //           const SizedBox(height: 12),
              //           _buildTripInfoRow('Distance Left', mockLocationData['distanceToDestination'] as String),
              //           const SizedBox(height: 16),
              //           // Progress bar
              //           ClipRRect(
              //             borderRadius: BorderRadius.circular(4),
              //             child: LinearProgressIndicator(
              //               value: 0.65,
              //               minHeight: 8,
              //               backgroundColor: Colors.grey.shade200,
              //               valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade600),
              //             ),
              //           ),
              //           const SizedBox(height: 8),
              //           const Center(
              //             child: Text(
              //               '65% completed',
              //               style: TextStyle(
              //                 fontSize: 12,
              //                 color: Colors.black54,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
        
              // const SizedBox(height: 16),
        
              // Driver Information Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Driver Information',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.phone, size: 16),
                              label: const Text('Call'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade200,
                              child: CircleAvatar(
                                radius: 12,
                                // backgroundColor: Colors.grey.shade600,
                                child: Icon(Icons.person),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vehicle.driverName,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    vehicle.driverPhone,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        
              // const SizedBox(height: 16),
        
              // // Location History Card
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Card(
              //     child: Padding(
              //       padding: const EdgeInsets.all(16.0),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           const Text(
              //             'Recent Locations',
              //             style: TextStyle(
              //               fontSize: 16,
              //               fontWeight: FontWeight.w600,
              //             ),
              //           ),
              //           const SizedBox(height: 16),
              //           ...recentLocations.asMap().entries.map((entry) {
              //             final index = entry.key;
              //             final location = entry.value;
              //             return Padding(
              //               padding: const EdgeInsets.only(bottom: 12),
              //               child: Row(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Padding(
              //                     padding: const EdgeInsets.only(top: 4),
              //                     child: Container(
              //                       height: 8,
              //                       width: 8,
              //                       decoration: BoxDecoration(
              //                         color: index == 0 ? Colors.green.shade500 : Colors.grey.shade300,
              //                         shape: BoxShape.circle,
              //                       ),
              //                     ),
              //                   ),
              //                   const SizedBox(width: 12),
              //                   Expanded(
              //                     child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Row(
              //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             Expanded(
              //                               child: Text(
              //                                 location['location'] as String,
              //                                 style: const TextStyle(
              //                                   fontSize: 14,
              //                                   fontWeight: FontWeight.w500,
              //                                 ),
              //                                 maxLines: 1,
              //                                 overflow: TextOverflow.ellipsis,
              //                               ),
              //                             ),
              //                             const SizedBox(width: 8),
              //                             Text(
              //                               location['speed'] as String,
              //                               style: const TextStyle(
              //                                 fontSize: 12,
              //                                 color: Colors.black54,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                         const SizedBox(height: 2),
              //                         Text(
              //                           location['time'] as String,
              //                           style: const TextStyle(
              //                             fontSize: 12,
              //                             color: Colors.black54,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             );
              //           }).toList(),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
        
              const SizedBox(height: 16),
                // Vehicle Status Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.directions_car,
                                size: 24,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vehicle.plateNumber,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${vehicle.make} ${vehicle.model}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            StatusBadge(label: vehicle.status.toString()),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Status grid
                        Row(
                          children: [
                            Expanded(
                              child: _buildStatusItem(
                                icon: Icons.speed,
                                label: 'Current Speed',
                                value: mockLocationData['speed'] as String,
                              ),
                            ),
                            Expanded(
                              child: _buildStatusItem(
                                icon: Icons.navigation,
                                label: 'Direction',
                                value: mockLocationData['heading'] as String,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildStatusItem(
                                icon: Icons.local_gas_station,
                                label: 'Fuel Level',
                                value: '${vehicle.fuelLevel ?? 0}%',
                                valueColor: _getFuelColor(vehicle.fuelLevel?.toInt()),
                              ),
                            ),
                            Expanded(
                              child: _buildStatusItem(
                                icon: Icons.access_time,
                                label: 'Last Update',
                                value: mockLocationData['lastUpdate'] as String,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        
              const SizedBox(height: 16),
        
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusItem({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade400),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: valueColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTripInfoRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black54,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  Color _getFuelColor(int? level) {
    if (level == null) return Colors.grey.shade400;
    if (level > 50) return Colors.green.shade600;
    if (level > 25) return Colors.yellow.shade600;
    return Colors.red.shade600;
  }
}
