import 'package:flutter/material.dart';
import '../../widgets/mobile_header.dart';
import 'widgets/vehicle_report_item.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

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
      'location': 'Pune, Maharashtra',
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
      'location': 'Bangalore, Karnataka',
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
      'location': 'Ahmedabad, Gujarat',
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
      'location': 'New Delhi, Delhi',
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
      'location': 'Chennai, Tamil Nadu',
    },
  ];

  List<Map<String, dynamic>> get filteredData {
    if (selectedVehicle == 'all') {
      return vehicleReportData;
    }
    return vehicleReportData
        .where((v) => v['registration'] == selectedVehicle)
        .toList();
  }

  int get onlineVehicles =>
      vehicleReportData.where((v) => v['deviceStatus'] == 'online').length;
  int get offlineVehicles =>
      vehicleReportData.where((v) => v['deviceStatus'] == 'offline').length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MobileHeader(
        title: 'Vehicle Reports',
        subtitle: 'KM run and device status',
        canGoBack: false,
        action: [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      return VehicleReportItem(vehicle: vehicle);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
