import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';

class ExportDataScreen extends StatefulWidget {
  const ExportDataScreen({Key? key}) : super(key: key);

  @override
  State<ExportDataScreen> createState() => _ExportDataScreenState();
}

class _ExportDataScreenState extends State<ExportDataScreen> {
  String selectedDataType = 'vehicles';
  String selectedFormat = 'csv';
  String dateRange = '30days';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const MobileHeader(
        title: 'Export Data',
        subtitle: 'Download reports and data',
        canGoBack: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info Card
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: AppColors.primary),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Export your fleet data in various formats for analysis and record keeping.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Data Type Selection
            const Text(
              'Select Data Type',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            _buildDataTypeCard(
              icon: Icons.directions_car,
              title: 'Vehicle Data',
              description: 'Vehicle details, status, and KM run data',
              value: 'vehicles',
            ),
            _buildDataTypeCard(
              icon: Icons.person,
              title: 'Driver Data',
              description: 'Driver information and assignments',
              value: 'drivers',
            ),
            _buildDataTypeCard(
              icon: Icons.route,
              title: 'Trip History',
              description: 'Complete trip records and routes',
              value: 'trips',
            ),
            _buildDataTypeCard(
              icon: Icons.assessment,
              title: 'KM Reports',
              description: 'Detailed kilometer run reports',
              value: 'km_reports',
            ),
            _buildDataTypeCard(
              icon: Icons.device_hub,
              title: 'Device Status',
              description: 'Online/offline device history',
              value: 'devices',
            ),

            const SizedBox(height: 24),

            // Date Range Selection
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Date Range',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: dateRange,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(value: '7days', child: Text('Last 7 Days')),
                        DropdownMenuItem(value: '30days', child: Text('Last 30 Days')),
                        DropdownMenuItem(value: '90days', child: Text('Last 90 Days')),
                        DropdownMenuItem(value: '1year', child: Text('Last 1 Year')),
                        DropdownMenuItem(value: 'custom', child: Text('Custom Range')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          dateRange = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Format Selection
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Export Format',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildFormatOption(
                      format: 'csv',
                      icon: Icons.table_chart,
                      title: 'CSV',
                      description: 'Comma-separated values (Excel compatible)',
                    ),
                    const Divider(),
                    _buildFormatOption(
                      format: 'excel',
                      icon: Icons.grid_on,
                      title: 'Excel (XLSX)',
                      description: 'Microsoft Excel format',
                    ),
                    const Divider(),
                    _buildFormatOption(
                      format: 'pdf',
                      icon: Icons.picture_as_pdf,
                      title: 'PDF',
                      description: 'Portable document format',
                    ),
                    const Divider(),
                    _buildFormatOption(
                      format: 'json',
                      icon: Icons.code,
                      title: 'JSON',
                      description: 'JavaScript object notation',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Summary Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Export Summary',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildSummaryRow('Data Type', _getDataTypeName()),
                    const SizedBox(height: 8),
                    _buildSummaryRow('Date Range', _getDateRangeName()),
                    const SizedBox(height: 8),
                    _buildSummaryRow('Format', selectedFormat.toUpperCase()),
                    const SizedBox(height: 8),
                    _buildSummaryRow('Estimated Size', '~2.5 MB'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Export Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showExportDialog(context);
                },
                icon: const Icon(Icons.download),
                label: const Text(
                  'Export Data',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataTypeCard({
    required IconData icon,
    required String title,
    required String description,
    required String value,
  }) {
    final isSelected = selectedDataType == value;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: isSelected ? Colors.blue.shade50 : Colors.white,
      child: InkWell(
        onTap: () {
          setState(() {
            selectedDataType = value;
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withOpacity(0.2)
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? AppColors.primary : Colors.grey.shade600,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? AppColors.primary : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(Icons.check_circle, color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormatOption({
    required String format,
    required IconData icon,
    required String title,
    required String description,
  }) {
    final isSelected = selectedFormat == format;

    return InkWell(
      onTap: () {
        setState(() {
          selectedFormat = format;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : Colors.grey.shade600,
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? AppColors.primary : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: format,
              groupValue: selectedFormat,
              onChanged: (value) {
                setState(() {
                  selectedFormat = value!;
                });
              },
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
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
    );
  }

  String _getDataTypeName() {
    switch (selectedDataType) {
      case 'vehicles':
        return 'Vehicle Data';
      case 'drivers':
        return 'Driver Data';
      case 'trips':
        return 'Trip History';
      case 'km_reports':
        return 'KM Reports';
      case 'devices':
        return 'Device Status';
      default:
        return 'Unknown';
    }
  }

  String _getDateRangeName() {
    switch (dateRange) {
      case '7days':
        return 'Last 7 Days';
      case '30days':
        return 'Last 30 Days';
      case '90days':
        return 'Last 90 Days';
      case '1year':
        return 'Last 1 Year';
      case 'custom':
        return 'Custom Range';
      default:
        return 'Unknown';
    }
  }

  void _showExportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Data'),
        content: const Text(
          'Your data export will be processed and downloaded shortly. You will receive a notification when it\'s ready.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Exporting data... Download will start shortly.'),
                  duration: Duration(seconds: 3),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
            child: const Text('Export'),
          ),
        ],
      ),
    );
  }
}
