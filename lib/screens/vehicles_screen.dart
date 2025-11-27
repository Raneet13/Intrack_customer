import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/add_vehicle_screen.dart';
import 'package:intrack_customer/screens/track_vehicle_screen.dart';
import 'package:intrack_customer/screens/vehicle_details_screen.dart';
import 'package:intrack_customer/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../providers/vehicle_provider.dart';
import '../theme/app_theme.dart';
import '../models/vehicle.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicles'),
        actions: [
          //  Padding(
          //   padding: const EdgeInsets.only(right: 8.0),
          //   child: ElevatedButton.icon(
          //     onPressed: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddVehicleScreen()));
          //     },
          //     icon: const Icon(Icons.add, size: 16),
          //     label: const Text('Add Vehicle'),
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: AppColors.primary,
          //       foregroundColor: Colors.white,
          //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          //       textStyle: const TextStyle(fontSize: 14),
          //     ),
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VehiclesHeaderWidget(),
            Consumer<VehicleProvider>(
              builder: (context, provider, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemCount: provider.vehicles.length,
                  itemBuilder: (context, index) {
                    return _buildVehicleCard(context, provider.vehicles[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
     
    );
  }



  Widget _buildVehicleCard(BuildContext context, Vehicle vehicle) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom:  12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- TOP ROW ----------
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Vehicle Icon
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xffEAF2FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.local_shipping,
                    color: Color(0xff3B73F0), size: 28),
              ),
              const SizedBox(width: 12),
      
              // Vehicle Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "MH12AB1234",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Tata LPT 1613 (2022)",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
      
              // Status Badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color:vehicle.id=="1"? Colors.orange: const Color(0xff3B73F0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child:  Text(
                  "${vehicle.id=="1"? "In Active": "Active"}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
      
          const SizedBox(height: 16),
      
          // ---------- DRIVER ----------
          Row(
            children: [
              const Icon(Icons.person, size: 20, color: Colors.black54),
              const SizedBox(width: 6),
              Text(
                "Raj Sharma",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade800,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xffEAF2FF),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.call,
                    color: Color(0xff3B73F0), size: 18),
              )
            ],
          ),
      
          const SizedBox(height: 10),
      
          // ---------- LOCATION ----------
          Row(
            children: [
              const Icon(Icons.location_on,
                  size: 20, color: Colors.black54),
              const SizedBox(width: 6),
              Text(
                "Mumbai",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
      
          // const SizedBox(height: 6),
      
          // // ---------- KM + SERVICE ----------
          // Text(
          //   "KMs: 48,520 • Service: 15 days ago",
          //   style: TextStyle(
          //     fontSize: 12,
          //     color: Colors.grey.shade600,
          //   ),
          // ),
      
          const SizedBox(height: 16),
      
          // ---------- SUBSCRIPTION STATUS BOX ----------
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xffFAFAFF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Subscription Status",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color:vehicle.id=="1"? Colors.orange.shade50: const Color(0xffDFFBEA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:  Text(
                        "${vehicle.id=="1"? "Expaired": "Active"}",
                        style: TextStyle(
                          color:vehicle.id=="1"? Colors.orange: Color(0xff2FA36A),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
      
                const SizedBox(height: 10),
      
                Row(
                  children: [
                    // Device Installed
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.calendar_today,
                                  size: 16, color: Colors.black54),
                              SizedBox(width: 6),
                              Text("Device Installed",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "15 Jan 2024",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
      
                    // Next Renewal
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.calendar_today,
                                  size: 16, color: Colors.black54),
                              SizedBox(width: 6),
                              Text("Next Renewal",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54)),
                            ],
                          ),
                          const SizedBox(height: 6),
                           Text(
                            "${vehicle.id=="1"?"15 May 2025": "15 Jan 2026"}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color:vehicle.id=="1"? Colors.red: Color(0xff1BA55A)),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
      
          const SizedBox(height: 16),
      
          // ---------- ACTION BUTTONS ----------
          Row(
            children: [
             vehicle.id=="1"?
             Expanded(
                child: InkWell(
                  onTap: (){
                     showRenewDialog(context);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => TrackVehicleScreen( vehicle: vehicle,)));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.payments_outlined, size: 18),
                          SizedBox(width: 6),
                          Text("Renuew Now"),
                        ],
                      ),
                    ),
                  ),
                ),
              ): Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TrackVehicleScreen( vehicle: vehicle,)));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.navigation, size: 18),
                          SizedBox(width: 6),
                          Text("Track"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child:  InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddVehicleScreen( editingVehicle: vehicle,)));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit, size: 18),
                          SizedBox(width: 6),
                          Text("Edit"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
void showRenewDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Confirm Renewal"),
        content: const Text("Are you sure you want to renew your vehicle?"),
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
              showSuccessDialog(context); // show success message
            },
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );
}

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Success"),
        content: const Text("Your vehicle renewed successfully!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}


class VehiclesHeaderWidget extends StatelessWidget {
  final String searchHint;
  final int activeCount;
  final int idleCount;
  final ValueChanged<String>? onSearch;
  final ValueChanged<String>? onFilterChanged;

  const VehiclesHeaderWidget({
    super.key,
    this.searchHint = 'Search vehicles, drivers...',
    this.activeCount = 2,
    this.idleCount = 2,
    this.onSearch,
    this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = 12.0;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SEARCH BAR
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: TextField(
            onChanged: onSearch,
            decoration: InputDecoration(
              hintText: searchHint,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFF4F6F8),
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // FILTER PILL BUTTONS
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _filterPill(context, 'All', selected: true, onTap: () => _callFilter('All')),
              _filterPill(context, 'Active', selected: false, onTap: () => _callFilter('Active')),
              _filterPill(context, 'Idle', selected: false, onTap: () => _callFilter('Idle')),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // STAT CARDS (two cards)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(child: _statCard(context, activeCount, 'Active')),
              const SizedBox(width: 12),
              Expanded(child: _statCard(context, idleCount, 'Idle')),
            ],
          ),
        ),
      ],
    );
  }

  Widget _filterPill(BuildContext context, String label, {bool selected = false, VoidCallback? onTap}) {
    return Material(
      color: selected ? const Color(0xFF2D6CED) : Colors.white,
      elevation: selected ? 0 : 0,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: selected ? Colors.transparent : const Color(0xFFE6E9EE)),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFF333A44),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _statCard(BuildContext context, int count, String label) {
    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8EDF2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: label == 'Active' ? const Color(0xFF1FA05D) : const Color(0xFF2E3A59),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _callFilter(String value) {
    if (onFilterChanged != null) onFilterChanged!(value);
  }
}




