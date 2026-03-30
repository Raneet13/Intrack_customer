import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/mobile_header.dart';
import 'widgets/data_type_card.dart';
import 'widgets/format_option.dart';
import 'widgets/export_summary_row.dart';

class ExportDataScreen extends StatefulWidget {
  const ExportDataScreen({super.key});

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
                        style: TextStyle(fontSize: 14, color: Colors.black87),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 12),

            DataTypeCard(
              icon: Icons.directions_car,
              title: 'Vehicle Data',
              description: 'Vehicle details, status, and KM run data',
              value: 'vehicles',
              selectedValue: selectedDataType,
              onTap: (value) => setState(() => selectedDataType = value),
            ),
            DataTypeCard(
              icon: Icons.person,
              title: 'Driver Data',
              description: 'Driver information and assignments',
              value: 'drivers',
              selectedValue: selectedDataType,
              onTap: (value) => setState(() => selectedDataType = value),
            ),
            DataTypeCard(
              icon: Icons.route,
              title: 'Trip History',
              description: 'Complete trip records and routes',
              value: 'trips',
              selectedValue: selectedDataType,
              onTap: (value) => setState(() => selectedDataType = value),
            ),
            DataTypeCard(
              icon: Icons.assessment,
              title: 'KM Reports',
              description: 'Detailed kilometer run reports',
              value: 'km_reports',
              selectedValue: selectedDataType,
              onTap: (value) => setState(() => selectedDataType = value),
            ),
            DataTypeCard(
              icon: Icons.device_hub,
              title: 'Device Status',
              description: 'Online/offline device history',
              value: 'devices',
              selectedValue: selectedDataType,
              onTap: (value) => setState(() => selectedDataType = value),
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
                      initialValue: dateRange,
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
                        DropdownMenuItem(
                          value: '7days',
                          child: Text('Last 7 Days'),
                        ),
                        DropdownMenuItem(
                          value: '30days',
                          child: Text('Last 30 Days'),
                        ),
                        DropdownMenuItem(
                          value: '90days',
                          child: Text('Last 90 Days'),
                        ),
                        DropdownMenuItem(
                          value: '1year',
                          child: Text('Last 1 Year'),
                        ),
                        DropdownMenuItem(
                          value: 'custom',
                          child: Text('Custom Range'),
                        ),
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
                    FormatOption(
                      format: 'csv',
                      icon: Icons.table_chart,
                      title: 'CSV',
                      description: 'Comma-separated values (Excel compatible)',
                      selectedFormat: selectedFormat,
                      onChanged: (value) =>
                          setState(() => selectedFormat = value),
                    ),
                    const Divider(),
                    FormatOption(
                      format: 'excel',
                      icon: Icons.grid_on,
                      title: 'Excel (XLSX)',
                      description: 'Microsoft Excel format',
                      selectedFormat: selectedFormat,
                      onChanged: (value) =>
                          setState(() => selectedFormat = value),
                    ),
                    const Divider(),
                    FormatOption(
                      format: 'pdf',
                      icon: Icons.picture_as_pdf,
                      title: 'PDF',
                      description: 'Portable document format',
                      selectedFormat: selectedFormat,
                      onChanged: (value) =>
                          setState(() => selectedFormat = value),
                    ),
                    const Divider(),
                    FormatOption(
                      format: 'json',
                      icon: Icons.code,
                      title: 'JSON',
                      description: 'JavaScript object notation',
                      selectedFormat: selectedFormat,
                      onChanged: (value) =>
                          setState(() => selectedFormat = value),
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
                    ExportSummaryRow(
                      label: 'Data Type',
                      value: _getDataTypeName(),
                    ),
                    const SizedBox(height: 8),
                    ExportSummaryRow(
                      label: 'Date Range',
                      value: _getDateRangeName(),
                    ),
                    const SizedBox(height: 8),
                    ExportSummaryRow(
                      label: 'Format',
                      value: selectedFormat.toUpperCase(),
                    ),
                    const SizedBox(height: 8),
                    ExportSummaryRow(label: 'Estimated Size', value: '~2.5 MB'),
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
                  content: Text(
                    'Exporting data... Download will start shortly.',
                  ),
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
