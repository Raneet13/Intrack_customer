import 'package:flutter/material.dart';
import 'widgets/vehicle_info_card.dart';
import 'widgets/date_tabs_section.dart';
import 'widgets/tracking_history_section.dart';

class VehicleTrackingScreen extends StatefulWidget {
  const VehicleTrackingScreen({super.key});

  @override
  _VehicleTrackingScreenState createState() => _VehicleTrackingScreenState();
}

class _VehicleTrackingScreenState extends State<VehicleTrackingScreen> {
  var selectedTab = "today";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tracking: MH12AB1234',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Tata LPT 1613',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),

              // Vehicle Info Card
              VehicleInfoCard(),

              SizedBox(height: 16),

              // Date Filter Card
              DateTabsSection(
                selectedTab: selectedTab,
                onTabChanged: (value) {
                  setState(() {
                    selectedTab = value;
                  });
                },
              ),

              SizedBox(height: 16),

              // Tracking History
              TrackingHistorySection(),

              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
