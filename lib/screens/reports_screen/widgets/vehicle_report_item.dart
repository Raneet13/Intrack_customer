import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/report_vehicle_details/report_vehicle_details.dart';
import '../../../theme/app_colors.dart';

class VehicleReportItem extends StatelessWidget {
  final Map<String, dynamic> vehicle;

  const VehicleReportItem({super.key, required this.vehicle});

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  String _formatDateTime(String dateTime) {
    return dateTime.replaceAll('-', '/');
  }

  Widget _buildKmDataCard(
    BuildContext context, {
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
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
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
          style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
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
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
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

  @override
  Widget build(BuildContext context) {
    final IconData vehicleIcon = vehicle['vehicleType'] == 'truck'
        ? Icons.local_shipping
        : Icons.directions_car;

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
                  context,
                  label: 'Opening KMs',
                  value: _formatNumber(vehicle['openingKms'] as int),
                  color: Colors.indigo,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildKmDataCard(
                  context,
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
                  context,
                  label: 'KMs Covered',
                  value: _formatNumber(vehicle['kmsCovered'] as int),
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildKmDataCard(
                  context,
                  label: 'Today KM',
                  value: _formatNumber(vehicle['monthlyKm'] as int),
                  color: Colors.orange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Additional Info
          Row(
            children: [
              Expanded(
                child: _buildInfoRow(
                  'Current Location:',
                  vehicle['location'] as String,
                ),
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
                  builder: (context) => VehicleTrackingScreen(),
                ),
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
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "View Tracking Details",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
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
}
