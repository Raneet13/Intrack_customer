import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/add_driver_screen.dart';
import 'package:intrack_customer/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../providers/driver_provider.dart';
import '../../theme/app_theme.dart';
import 'widgets/driver_card.dart';

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddDriverScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Add Driver'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
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
                    return DriverCard(driver: provider.drivers[index]);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
