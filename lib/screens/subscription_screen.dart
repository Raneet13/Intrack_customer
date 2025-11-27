import 'package:flutter/material.dart';



// ========================================
// Complete Subscription Page
// ========================================
class SubscriptionPage extends StatelessWidget {
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
              'Subscription',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Manage your billing plans',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(12),
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
              color:Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child:  Text(
              "In Active",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
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
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Text(
                    "${ "Expaired"}",
                    style: TextStyle(
                      color: Colors.orange,
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
                        "${"15 May 2025"}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.red),
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
                
        InkWell(
          onTap: (){
             showRenewDialog(context);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => TrackVehicleScreen( vehicle: vehicle,)));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
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
        )
                  
                ],
              ),
            ),
      ),
    );
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
            },
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );
}

}