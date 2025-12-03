import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/mobile_header.dart';
import 'widgets/section_header.dart';
import 'widgets/switch_tile.dart';
import 'widgets/dropdown_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotifications = true;
  bool emailNotifications = true;
  bool locationTracking = true;
  bool autoRefresh = false;
  String mapType = 'standard';
  String distanceUnit = 'km';
  String language = 'english';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const MobileHeader(
        title: 'App Settings',
        subtitle: 'Customize your preferences',
        canGoBack: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notifications Section
            SectionHeader(title: 'Notifications'),
            Card(
              child: Column(
                children: [
                  SwitchTile(
                    title: 'Push Notifications',
                    subtitle: 'Receive notifications on your device',
                    value: pushNotifications,
                    onChanged: (value) {
                      setState(() {
                        pushNotifications = value;
                      });
                    },
                  ),
                  const Divider(height: 1),
                  SwitchTile(
                    title: 'Email Notifications',
                    subtitle: 'Receive updates via email',
                    value: emailNotifications,
                    onChanged: (value) {
                      setState(() {
                        emailNotifications = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Tracking Section
            SectionHeader(title: 'Tracking'),
            Card(
              child: Column(
                children: [
                  SwitchTile(
                    title: 'Location Tracking',
                    subtitle: 'Enable real-time vehicle tracking',
                    value: locationTracking,
                    onChanged: (value) {
                      setState(() {
                        locationTracking = value;
                      });
                    },
                  ),
                  const Divider(height: 1),
                  SwitchTile(
                    title: 'Auto Refresh',
                    subtitle: 'Automatically update vehicle positions',
                    value: autoRefresh,
                    onChanged: (value) {
                      setState(() {
                        autoRefresh = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Display Section
            SectionHeader(title: 'Display'),
            Card(
              child: Column(
                children: [
                  DropdownTile(
                    title: 'Map Type',
                    subtitle: mapType == 'standard'
                        ? 'Standard'
                        : mapType == 'satellite'
                        ? 'Satellite'
                        : 'Hybrid',
                    value: mapType,
                    items: const [
                      {'value': 'standard', 'label': 'Standard'},
                      {'value': 'satellite', 'label': 'Satellite'},
                      {'value': 'hybrid', 'label': 'Hybrid'},
                    ],
                    onChanged: (value) {
                      setState(() {
                        mapType = value!;
                      });
                    },
                  ),
                  const Divider(height: 1),
                  DropdownTile(
                    title: 'Distance Unit',
                    subtitle: distanceUnit == 'km' ? 'Kilometers' : 'Miles',
                    value: distanceUnit,
                    items: const [
                      {'value': 'km', 'label': 'Kilometers (km)'},
                      {'value': 'miles', 'label': 'Miles (mi)'},
                    ],
                    onChanged: (value) {
                      setState(() {
                        distanceUnit = value!;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Language Section
            SectionHeader(title: 'Language'),
            Card(
              child: DropdownTile(
                title: 'App Language',
                subtitle: language == 'english' ? 'English' : 'हिंदी',
                value: language,
                items: const [
                  {'value': 'english', 'label': 'English'},
                  {'value': 'hindi', 'label': 'हिंदी (Hindi)'},
                ],
                onChanged: (value) {
                  setState(() {
                    language = value!;
                  });
                },
              ),
            ),

            const SizedBox(height: 24),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Settings saved successfully'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
