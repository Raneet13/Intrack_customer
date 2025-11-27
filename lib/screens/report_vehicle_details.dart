import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/view_map_screen.dart';

// ========================================
// Vehicle Tracking Screen
// ========================================
class VehicleTrackingScreen extends StatefulWidget {
  @override
  _VehicleTrackingScreenState createState() => _VehicleTrackingScreenState();
}

class _VehicleTrackingScreenState extends State<VehicleTrackingScreen> {
  DateTime fromDate = DateTime(2025, 11, 17);
  DateTime toDate = DateTime(2025, 11, 24);
  var selectedTab= "today";

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
              _buildVehicleInfoCard(),
              
              SizedBox(height: 16),
              
              // Date Filter Card
              _buildDateTabs(),
              
              
              SizedBox(height: 16),
              
              // Tracking History
              _buildTrackingHistory(),
              
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleInfoCard() {
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
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.local_shipping,
                  color: Colors.blue,
                  size: 24,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MH12AB1234',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Tata LPT 1613',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'ONLINE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoItem('Current KM', '70,680', Colors.blue),
                // Container(width: 1, height: 30, color: Colors.grey[300]),
                _buildInfoItem('Today\'s KM', '112', Colors.green),
                // Container(width: 1, height: 30, color: Colors.grey[300]),
                _buildInfoItem('Driver', 'Raj', Colors.purple),
              ],
            ),
          
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, Color color) {
    return Container(
      height: 50,
      width: (MediaQuery.of(context).size.width - 80) / 3.2,
      // padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
            ),
          ),
          // SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildTrackingHistory() {
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
                  // Implement export functionality
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>GPSTrackingScreen()));
                },
                icon: Icon(Icons.location_searching, size: 16,color: Colors.white,),
                label: Text('View Map', style: TextStyle(fontSize: 13)),
                style: ElevatedButton.styleFrom(
                  surfaceTintColor: Colors.blue,
                  // pr=: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          ...records.map((record) => _buildTrackingItem(record)).toList(),
        ],
      ),
    );
  }

  Widget _buildTrackingItem(TrackingRecord record) {
    Color statusColor;
    Color statusBgColor;
    
    switch (record.status) {
      case 'Current':
        statusColor = Colors.blue;
        statusBgColor = Colors.blue[100]!;
        break;
      case 'Moving':
        statusColor = Colors.green[700]!;
        statusBgColor = Colors.green[50]!;
        break;
      case 'Stopped':
        statusColor = Colors.grey[700]!;
        statusBgColor = Colors.grey[200]!;
        break;
      default:
        statusColor = Colors.grey;
        statusBgColor = Colors.grey[200]!;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '${record.date} • ${record.time}',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  record.status,
                  style: TextStyle(
                    fontSize: 11,
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.blue),
              SizedBox(width: 6),
              Text(
                record.location,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.speed, size: 14, color: Colors.purple),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'KM Reading',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          record.kmReading,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.speed, size: 14, color: Colors.orange),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Speed',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          record.speed,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

Widget _buildDateTabs() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTab('Today', 'today'),
            const SizedBox(width: 8),
            _buildTab('Yesterday', 'yesterday'),
            const SizedBox(width: 8),
            _buildTab('Last 7 days', 'last7days'),
            const SizedBox(width: 8),
            _buildTabWithIcon('Date range', 'daterange', Icons.calendar_today),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, String value) {
    final isSelected = selectedTab ==value;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade50 : Colors.grey[200],
          border: Border.all(
            color: isSelected ? Colors.green : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.green : Colors.grey[700],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTabWithIcon(String label, String value, IconData icon) {
    final isSelected = selectedTab==value;
    return GestureDetector(
      // onTap: () => ,
      onTap: () =>{
     _buildDateFilterCard(context),    
     setState(() => selectedTab = value)
      
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[700],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : Colors.grey[700],
            ),
          ],
        ),
      ),
    );
  }

    void _buildDateFilterCard(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.only(top: 20),
        scrollable: true,
        // title: const Text("Confirm Renewal"),
        content:Container(
          width: double.infinity,
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today, size: 18),
              SizedBox(width: 8),
              Text(
                'Filter by Date',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From Date',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 6),
                    InkWell(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: fromDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          setState(() => fromDate = date);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${fromDate.month}/${fromDate.day}/${fromDate.year}',
                              style: TextStyle(fontSize: 14),overflow: TextOverflow.ellipsis,
                            ),
                            Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'To Date',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 6),
                    InkWell(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: toDate,
                          firstDate: fromDate,
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          setState(() => toDate = date);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${toDate.month}/${toDate.day}/${toDate.year}',
                              style: TextStyle(fontSize: 14),overflow: TextOverflow.ellipsis,
                            ),
                            Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
        ],
      ),
    ),
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
              // showSuccessDialog(context); // show success message
            },
            child: const Text("Submit"),
          ),
        ],
      );
    },
  );


  }

  
}

// ========================================
// Tracking Record Model
// ========================================
class TrackingRecord {
  final String date;
  final String time;
  final String location;
  final String kmReading;
  final String speed;
  final String status;

  TrackingRecord({
    required this.date,
    required this.time,
    required this.location,
    required this.kmReading,
    required this.speed,
    required this.status,
  });

  factory TrackingRecord.fromJson(Map<String, dynamic> json) {
    return TrackingRecord(
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      location: json['location'] ?? '',
      kmReading: json['km_reading'] ?? '',
      speed: json['speed'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
