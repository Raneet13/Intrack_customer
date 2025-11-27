import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/add_driver_screen.dart';
import 'package:intrack_customer/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../providers/driver_provider.dart';
import '../theme/app_theme.dart';
import '../models/driver.dart';
import 'package:intl/intl.dart';

class DriversScreen extends StatelessWidget {
  const DriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drivers'),
        actions: [
           Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddDriverScreen()));
              },
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Add Driver'),
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
      body: SingleChildScrollView(
        child: Consumer<DriverProvider>(
          builder: (context, provider, _) {
            final expiringLicenses = provider.getDriversWithExpiringLicenses();
            
            return Column(
              children: [
                // Warning Banner for Expiring Licenses
                if (expiringLicenses.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.warning.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppTheme.warning.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.warning_amber,
                          color: AppTheme.warning,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            '${expiringLicenses.length} driver license(s) expiring soon',
                            style: AppTheme.bodyMedium.copyWith(
                              color: AppTheme.warning,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                
                // Drivers List
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: provider.drivers.length,
                  itemBuilder: (context, index) {
                    return _buildDriverCard(context, provider.drivers[index]);
                  },
                ),
              ],
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text('Add Driver feature coming soon')),
      //     );
      //   },
      //   icon: const Icon(Icons.person_add),
      //   label: const Text('Add Driver'),
      // ),
    );
  }

  Widget _buildDriverCard(BuildContext context, Driver driver) {
    final statusColor = _getStatusColor(driver.status);
    final isLicenseExpiring = driver.isLicenseExpiring;
    final isLicenseExpired = driver.isLicenseExpired;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: AppTheme.cardDecoration,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppTheme.primaryBlue.withOpacity(0.1),
                    child: Text(
                      driver.name.substring(0, 1).toUpperCase(),
                      style: AppTheme.headingMedium.copyWith(
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          driver.name,
                          style: AppTheme.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          driver.phone,
                          style: AppTheme.bodySmall.copyWith(
                            color: AppTheme.textGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      driver.status.toUpperCase(),
                      style: AppTheme.caption.copyWith(
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              
              const Divider(height: 24),
              
              // License Info
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'License Number',
                          style: AppTheme.caption.copyWith(
                            color: AppTheme.textGray,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          driver.licenseNumber,
                          style: AppTheme.bodySmall.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(width: 16),
                  // Expanded(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Text(
                  //             'Expiry Date',
                  //             style: AppTheme.caption.copyWith(
                  //               color: AppTheme.textGray,
                  //             ),
                  //           ),
                  //           if (isLicenseExpiring || isLicenseExpired)
                  //             Padding(
                  //               padding: const EdgeInsets.only(left: 4),
                  //               child: Icon(
                  //                 Icons.warning_amber,
                  //                 size: 12,
                  //                 color: isLicenseExpired 
                  //                     ? AppTheme.error 
                  //                     : AppTheme.warning,
                  //               ),
                  //             ),
                  //         ],
                  //       ),
                  //       const SizedBox(height: 4),
                  //       Text(
                  //         DateFormat('dd MMM yyyy').format(driver.licenseExpiry),
                  //         style: AppTheme.bodySmall.copyWith(
                  //           fontWeight: FontWeight.w600,
                  //           color: isLicenseExpired 
                  //               ? AppTheme.error 
                  //               : isLicenseExpiring 
                  //                   ? AppTheme.warning 
                  //                   : null,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Stats Row
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: _buildStatChip(
                        Icons.call,
                        'Call',
                        AppTheme.bgLight,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDriverScreen(editingDriver: driver,)));
                        },
                        child: _buildStatChip(
                          Icons.edit_note_outlined,
                          'Edit',
                          AppTheme.bgLight,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          
                          showDeleteDialog(context);
                        },
                        child: _buildStatChip(
                          Icons.delete_outline,
                          'Delete',
                          AppTheme.bgLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              if (driver.currentVehicleName != null) ...[
                const Divider(height: 24),
                Row(
                  children: [
                    const Icon(
                      Icons.local_shipping,
                      size: 16,
                      color: AppTheme.textGray,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Assigned: ${driver.currentVehicleName}',
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.textGray,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
void showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // backgroundColor: AppTheme.accentOrange.withOpacity(0.1),
        title: const Text("Confirm Delete"),
        content: const Text("Are you sure you want to delete the Driver?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
            },
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close first dialog
              
            },
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );
}
  Widget _buildStatChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(icon, size: 14, color: AppTheme.textDark),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTheme.caption.copyWith(
              color: AppTheme.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return AppTheme.success;
      case 'on leave':
        return AppTheme.warning;
      case 'inactive':
        return AppTheme.error;
      default:
        return AppTheme.textGray;
    }
  }
}
