import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/view_map_screen/view_map_screen.dart';
import '../../../models/tracking_record.dart';
import 'tracking_item.dart';

class TrackingHistorySection extends StatelessWidget {
  const TrackingHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TrackingRecord> records = [
      TrackingRecord(
        date: '24 Nov 2025',
        time: '15:20',
        location: 'Mumbai, Maharashtra',
        kmReading: '70,082',
        speed: '68 km/h',
        status: 'Current',
      ),
      TrackingRecord(
        date: '23 Nov 2025',
        time: '10:54',
        location: 'Bangalore, Karnataka',
        kmReading: '69,890',
        speed: '0 km/h',
        status: 'Moving',
      ),
      TrackingRecord(
        date: '22 Nov 2025',
        time: '18:23',
        location: 'Mumbai, Maharashtra',
        kmReading: '69,700',
        speed: '61 km/h',
        status: 'Moving',
      ),
      TrackingRecord(
        date: '21 Nov 2025',
        time: '9:51',
        location: 'Bangalore, Karnataka',
        kmReading: '69,500',
        speed: '0 km/h',
        status: 'Stopped',
      ),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Tracking History',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GPSTrackingScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.location_searching,
                  size: 16,
                  color: Colors.white,
                ),
                label: Text('View Map', style: TextStyle(fontSize: 13)),
                style: ElevatedButton.styleFrom(
                  surfaceTintColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          ...records.map((record) => TrackingItem(record: record)).toList(),
        ],
      ),
    );
  }
}
