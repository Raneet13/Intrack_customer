import 'package:flutter/material.dart';
import 'widgets/map_header.dart';
import 'widgets/map_date_tabs.dart';
import 'widgets/map_area.dart';

class GPSTrackingScreen extends StatefulWidget {
  const GPSTrackingScreen({Key? key}) : super(key: key);

  @override
  State<GPSTrackingScreen> createState() => _GPSTrackingScreenState();
}

class _GPSTrackingScreenState extends State<GPSTrackingScreen> {
  String selectedTab = 'today';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            MapHeader(),

            // Date Filter Tabs
            MapDateTabs(
              selectedTab: selectedTab,
              onTabChanged: (value) {
                setState(() {
                  selectedTab = value;
                });
              },
            ),

            // Map Area
            Expanded(child: MapArea()),
          ],
        ),
      ),
    );
  }
}
