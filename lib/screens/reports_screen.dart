import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/report_vehicle_details.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';
import '../widgets/status_badge.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String selectedVehicle = 'all';

  // Mock data for vehicle km run and device status
  final List<Map<String, dynamic>> vehicleReportData = [
    {
      'id': 1,
      'registration': 'MH12AB1234',
      'driverName': 'Raj Sharma',
      'vehicleType': 'truck',
      'model': 'Tata LPT 1613',
      'openingKms': 25000,
      'currentKms': 70680,
      'kmsCovered': 45680,
      'monthlyKm': 3420,
      'weeklyKm': 785,
      'dailyKm': 112,
      'deviceStatus': 'online',
      'lastUpdated': '2025-01-15 14:30',
      'location': 'Pune, Maharashtra'
    },
    {
      'id': 2,
      'registration': 'KA05CD5678',
      'driverName': 'Anil Kumar',
      'vehicleType': 'car',
      'model': 'Maruti Dzire',
      'openingKms': 15000,
      'currentKms': 43450,
      'kmsCovered': 28450,
      'monthlyKm': 2150,
      'weeklyKm': 495,
      'dailyKm': 71,
      'deviceStatus': 'online',
      'lastUpdated': '2025-01-15 14:25',
      'location': 'Bangalore, Karnataka'
    },
    {
      'id': 3,
      'registration': 'GJ01EF9012',
      'driverName': 'Vikas Patel',
      'vehicleType': 'truck',
      'model': 'Ashok Leyland Dost',
      'openingKms': 18500,
      'currentKms': 85730,
      'kmsCovered': 67230,
      'monthlyKm': 4890,
      'weeklyKm': 1125,
      'dailyKm': 161,
      'deviceStatus': 'offline',
      'lastUpdated': '2025-01-15 10:15',
      'location': 'Ahmedabad, Gujarat'
    },
    {
      'id': 4,
      'registration': 'DL03GH3456',
      'driverName': 'Suresh Yadav',
      'vehicleType': 'car',
      'model': 'Hyundai Creta',
      'openingKms': 12000,
      'currentKms': 31670,
      'kmsCovered': 19670,
      'monthlyKm': 1580,
      'weeklyKm': 365,
      'dailyKm': 52,
      'deviceStatus': 'online',
      'lastUpdated': '2025-01-15 14:32',
      'location': 'New Delhi, Delhi'
    },
    {
      'id': 5,
      'registration': 'TN12IJ7890',
      'driverName': 'Murugan Raj',
      'vehicleType': 'truck',
      'model': 'Mahindra Bolero',
      'openingKms': 22000,
      'currentKms': 74340,
      'kmsCovered': 52340,
      'monthlyKm': 3780,
      'weeklyKm': 870,
      'dailyKm': 124,
      'deviceStatus': 'maintenance',
      'lastUpdated': '2025-01-14 18:45',
      'location': 'Chennai, Tamil Nadu'
    }
  ];

  List<Map<String, dynamic>> get filteredData {
    if (selectedVehicle == 'all') {
      return vehicleReportData;
    }
    return vehicleReportData.where((v) => v['registration'] == selectedVehicle).toList();
  }

  int get onlineVehicles => vehicleReportData.where((v) => v['deviceStatus'] == 'online').length;
  int get offlineVehicles => vehicleReportData.where((v) => v['deviceStatus'] == 'offline').length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MobileHeader(
        title: 'Vehicle Reports',
        subtitle: 'KM run and device status',
        canGoBack: false,
        action: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 8.0),
          //   child: ElevatedButton.icon(
          //     onPressed: _generateReport,
          //     icon: const Icon(Icons.download, size: 16),
          //     label: const Text('Export'),
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: AppColors.primary,
          //       foregroundColor: Colors.white,
          //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          //       textStyle: const TextStyle(fontSize: 14),
          //     ),
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Report Filters Card
            // Card(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const Row(
            //           children: [
            //             Icon(Icons.filter_list, size: 20),
            //             SizedBox(width: 8),
            //             Text(
            //               'Report Filters',
            //               style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w600,
            //               ),
            //             ),
            //           ],
            //         ),
            //         const SizedBox(height: 16),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             const Text(
            //               'Vehicle',
            //               style: TextStyle(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //             const SizedBox(height: 8),
            //             DropdownButtonFormField<String>(
            //               value: selectedVehicle,
            //               decoration: InputDecoration(
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(8),
            //                 ),
            //                 contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            //               ),
            //               items: [
            //                 const DropdownMenuItem(
            //                   value: 'all',
            //                   child: Text('All Vehicles'),
            //                 ),
            //                 ...vehicleReportData.map((vehicle) {
            //                   return DropdownMenuItem(
            //                     value: vehicle['registration'] as String,
            //                     child: Text('${vehicle['registration']} - ${vehicle['model']}'),
            //                   );
            //                 }).toList(),
            //               ],
            //               onChanged: (value) {
            //                 setState(() {
            //                   selectedVehicle = value!;
            //                 });
            //               },
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // const SizedBox(height: 16),

            // // Fleet Summary Cards
            // Row(
            //   children: [
            //     Expanded(
            //       child: Card(
            //         child: Padding(
            //           padding: const EdgeInsets.all(16.0),
            //           child: Row(
            //             children: [
            //               Icon(Icons.wifi, size: 32, color: AppColors.success),
            //               const SizedBox(width: 12),
            //               Expanded(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       'Online Devices',
            //                       style: TextStyle(
            //                         fontSize: 12,
            //                         color: AppColors.textSecondary,
            //                       ),
            //                     ),
            //                     const SizedBox(height: 4),
            //                     Text(
            //                       '$onlineVehicles',
            //                       style: const TextStyle(
            //                         fontSize: 24,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                     const SizedBox(height: 2),
            //                     Text(
            //                       'Active connections',
            //                       style: TextStyle(
            //                         fontSize: 11,
            //                         color: AppColors.success,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: 12),
            //     Expanded(
            //       child: Card(
            //         child: Padding(
            //           padding: const EdgeInsets.all(16.0),
            //           child: Row(
            //             children: [
            //               Icon(Icons.wifi_off, size: 32, color: AppColors.error),
            //               const SizedBox(width: 12),
            //               Expanded(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       'Offline Devices',
            //                       style: TextStyle(
            //                         fontSize: 12,
            //                         color: AppColors.textSecondary,
            //                       ),
            //                     ),
            //                     const SizedBox(height: 4),
            //                     Text(
            //                       '$offlineVehicles',
            //                       style: const TextStyle(
            //                         fontSize: 24,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                     const SizedBox(height: 2),
            //                     Text(
            //                       'Need attention',
            //                       style: TextStyle(
            //                         fontSize: 11,
            //                         color: AppColors.error,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            // const SizedBox(height: 16),

            // Vehicle-wise Report Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Vehicle-wise KM Run Data & Device Status',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...filteredData.map((vehicle) {
                      return _buildVehicleReportItem(vehicle);
                    }).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleReportItem(Map<String, dynamic> vehicle) {
    final IconData vehicleIcon = vehicle['vehicleType'] == 'truck' ? Icons.local_shipping : Icons.directions_car;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(vehicleIcon, size: 32, color: Colors.blue),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vehicle['registration'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        vehicle['model'] as String,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        'Driver: ${vehicle['driverName']}',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              _buildStatusBadge(vehicle['deviceStatus'] as String),
            ],
          ),

          const SizedBox(height: 16),

          // KM Data Grid
          Row(
            children: [
               Expanded(
                 child: _buildKmDataCard(
                  label: 'Opening KMs',
                  value: _formatNumber(vehicle['openingKms'] as int),
                  color: Colors.indigo,
                               ),
               ),
               SizedBox( width: 8,),
              Expanded(
                child: _buildKmDataCard(
                  label: 'Current KMs',
                  value: _formatNumber(vehicle['currentKms'] as int),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildKmDataCard(
                  label: 'KMs Covered',
                  value: _formatNumber(vehicle['kmsCovered'] as int),
                  color: Colors.green,
                ),
              ),
              SizedBox( width: 8,),
              Expanded(
                child: _buildKmDataCard(
                  label: 'Today KM',
                  value: _formatNumber(vehicle['monthlyKm'] as int),
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          // Wrap(
          //   spacing: 8,
          //   runSpacing: 8,
          //   children: [
             
              
          //     _buildKmDataCard(
          //       label: 'Daily KM',
          //       value: '${vehicle['dailyKm']}',
          //       color: Colors.purple,
          //     ),
          //   ],
          // ),

          const SizedBox(height: 16),

          // Additional Info
          Row(
            children: [
              Expanded(
                child: _buildInfoRow('Current Location:', vehicle['location'] as String),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildInfoRow(
                  'Last Updated:',
                  _formatDateTime(vehicle['lastUpdated'] as String),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>VehicleTrackingScreen()),
            );
            },
            child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xffFAFAFF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined,color: Colors.grey,size: 16,),
                    const SizedBox(width: 8),
                    Text("View Tracking Details",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        )),
                  ],
                ),
                ),
          )
        ],
      ),
    );
  }

  Widget _buildKmDataCard({
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      width: (MediaQuery.of(context).size.width - 80) / 2.2,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color dotColor;
    String text;

    switch (status) {
      case 'online':
        bgColor = AppColors.success.withOpacity(0.1);
        dotColor = AppColors.success;
        text = 'ONLINE';
        break;
      case 'offline':
        bgColor = AppColors.error.withOpacity(0.1);
        dotColor = AppColors.error;
        text = 'OFFLINE';
        break;
      case 'maintenance':
        bgColor = AppColors.warning.withOpacity(0.1);
        dotColor = AppColors.warning;
        text = 'MAINTENANCE';
        break;
      default:
        bgColor = Colors.grey.shade100;
        dotColor = Colors.grey;
        text = status.toUpperCase();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: dotColor,
            ),
          ),
        ],
      ),
    );
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  String _formatDateTime(String dateTime) {
    // Simple formatting for display
    return dateTime.replaceAll('-', '/');
  }

  void _generateReport() {
    // Show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Generating report...'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
