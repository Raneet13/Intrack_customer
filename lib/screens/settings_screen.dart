import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';

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
            _buildSectionHeader('Notifications'),
            Card(
              child: Column(
                children: [
                  _buildSwitchTile(
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
                  _buildSwitchTile(
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
            _buildSectionHeader('Tracking'),
            Card(
              child: Column(
                children: [
                  _buildSwitchTile(
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
                  _buildSwitchTile(
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
            _buildSectionHeader('Display'),
            Card(
              child: Column(
                children: [
                  _buildDropdownTile(
                    title: 'Map Type',
                    subtitle: mapType == 'standard' ? 'Standard' : mapType == 'satellite' ? 'Satellite' : 'Hybrid',
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
                  _buildDropdownTile(
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
            _buildSectionHeader('Language'),
            Card(
              child: _buildDropdownTile(
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownTile({
    required String title,
    required String subtitle,
    required String value,
    required List<Map<String, String>> items,
    required ValueChanged<String?> onChanged,
  }) {
    return InkWell(
      onTap: () {
        _showOptionsBottomSheet(
          context: context,
          title: title,
          items: items,
          currentValue: value,
          onChanged: onChanged,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 20,
              color: Colors.black38,
            ),
          ],
        ),
      ),
    );
  }

  void _showOptionsBottomSheet({
    required BuildContext context,
    required String title,
    required List<Map<String, String>> items,
    required String currentValue,
    required ValueChanged<String?> onChanged,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Divider(height: 1),
              ...items.map((item) {
                final isSelected = item['value'] == currentValue;
                return ListTile(
                  title: Text(item['label']!),
                  trailing: isSelected
                      ? Icon(Icons.check, color: AppColors.primary)
                      : null,
                  selected: isSelected,
                  onTap: () {
                    onChanged(item['value']);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
