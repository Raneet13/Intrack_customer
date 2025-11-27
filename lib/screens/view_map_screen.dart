import 'package:flutter/material.dart';



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
            _buildHeader(),
            
            // Date Filter Tabs
            _buildDateTabs(),
            
            // Map Area
            Expanded(
              child: _buildMapArea(),
            ),
            
            
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black87),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 8),
              const Text(
                'ODO5BX1877',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //   decoration: BoxDecoration(
          //     color: Colors.orange[50],
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: Row(
          //     children: const [
          //       Icon(Icons.play_arrow, color: Colors.orange, size: 18),
          //       SizedBox(width: 4),
          //       Text(
          //         'How it works?',
          //         style: TextStyle(
          //           color: Colors.orange,
          //           fontSize: 13,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildDateTabs() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTab('Today', 'today'),
        ],
      ),
    );
  }

  Widget _buildTab(String label, String value) {
    final isSelected = selectedTab == value;
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
          "10, May 2024 - 12, May 2025",
          style: TextStyle(
            color: isSelected ? Colors.green : Colors.grey[700],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }


  Widget _buildMapArea() {
    return Container(
     
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/show_map.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

