import 'package:flutter/material.dart';
import '../models/subscription.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plans = SubscriptionPlan.getAllPlans();

    return Scaffold(
      appBar: const MobileHeader(
        title: 'Subscription',
        subtitle: 'Choose your plan',
        showBackButton: true,
        canGoBack: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Plan Status
            Container(
                     padding: const EdgeInsets.all(16),
                     decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                     ),
                     child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
             const Text(
               "Current Subscription",
               style: TextStyle(
                   fontSize: 16, fontWeight: FontWeight.w600),
             ),
             Chip(
               label: const Text("Business"),
               backgroundColor: Colors.blue.shade50,
               labelStyle: const TextStyle(
                   color: Colors.blue, fontWeight: FontWeight.w500),
             ),
                            ],
                          ),
                        
                          const SizedBox(height: 10),
                        
                          Row(
                            children: const [
             Text(
               "Status:",
               style: TextStyle(fontSize: 14, color: Colors.grey),
             ),
             SizedBox(width: 6),
             Icon(Icons.check_circle, color: Colors.green, size: 18),
             SizedBox(width: 4),
             Text(
               "Active",
               style: TextStyle(
                 fontSize: 14,
                 color: Colors.green,
                 fontWeight: FontWeight.w600,
               ),
             ),
                            ],
                          ),
                        
                          const SizedBox(height: 14),
                        
                          const Text("Monthly Cost",
             style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 4),
                          const Text(
                            "₹2,499",
                            style: TextStyle(
               fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        
                          const SizedBox(height: 16),
                        
                          const Text("Vehicle Usage",
             style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 4),
                          const Text(
                            "7 / 10",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                        
                          // Progress Bar
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
             value: 7 / 10,
             minHeight: 8,
             backgroundColor: Colors.grey.shade200,
             color: Colors.blue,
                            ),
                          ),
                        
                          const SizedBox(height: 16),
                        
                          const Text("Next Billing",
             style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 4),
                          const Text(
                            "2/15/2025",
                            style:
               TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        
                          const SizedBox(height: 16),
                        
                          const Text("Payment Method",
             style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 4),
                          const Text(
                            "**** **** **** 4567",
                            style:
               TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        
                          const SizedBox(height: 20),
                        
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
             onPressed: () {},
             style: ElevatedButton.styleFrom(
               padding: const EdgeInsets.symmetric(vertical: 14),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
               ),
             ),
             child: const Text("Update Payment Method"),
                            ),
                          )
                        ],
                     ),
                   ),
                        
                   const SizedBox(height: 20),
                        
                   // 🔵 BILLING HISTORY CARD
                   Container(
                     padding: const EdgeInsets.all(16),
                     decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                     ),
                     child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Billing History",
                            style: TextStyle(
               fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 16),
                        
                          // Billing Items
                          ...[
                            {"date": "1/15/2025", "amount": "₹2,499", "id": "INV-2025-001"},
                            {"date": "12/15/2024", "amount": "₹2,499", "id": "INV-2024-012"},
                            {"date": "11/15/2024", "amount": "₹2,499", "id": "INV-2024-011"},
                            {"date": "10/15/2024", "amount": "₹2,499", "id": "INV-2024-010"},
                          ].map((item) {
                            return Padding(
             padding: const EdgeInsets.symmetric(vertical: 10),
             child: Row(
               mainAxisAlignment:
                   MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       item["date"]!,
                       style: const TextStyle(
                           fontWeight: FontWeight.w600),
                     ),
                     const SizedBox(height: 4),
                     Text(
                       item["id"]!,
                       style: const TextStyle(
                           fontSize: 12, color: Colors.grey),
                     ),
                   ],
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     Text(
                       item["amount"]!,
                       style: const TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.w600),
                     ),
                     const SizedBox(height: 4),
                     Text(
                       "Download",
                       style: TextStyle(
                         color: Colors.blue.shade600,
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ],
                 ),
               ],
             ),
                            );
                          }).toList(),
                        ],
                     ),
                   ),
            //                 Row(
            //  children: [
            //    Icon(Icons.check_circle, color: AppColors.success),
            //    const SizedBox(width: 8),
            //    const Text(
            //      'Current Plan',
            //      style: TextStyle(
            //        fontSize: 16,
            //        fontWeight: FontWeight.w600,
            //      ),
            //    ),
            //  ],
            //                 ),
            //                 const SizedBox(height: 12),
            //                 const Text(
            //  'Business Plan',
            //  style: TextStyle(
            //    fontSize: 20,
            //    fontWeight: FontWeight.bold,
            //  ),
            //                 ),
            //                 const SizedBox(height: 4),
            //                 Text(
            //  'Track up to 10 vehicles',
            //  style: TextStyle(
            //    fontSize: 14,
            //    color: AppColors.textSecondary,
            //  ),
            //                 ),
            //                 const SizedBox(height: 8),
            //                 Row(
            //  children: [
            //    Icon(
            //      Icons.access_time,
            //      size: 16,
            //      color: AppColors.warning,
            //    ),
            //    const SizedBox(width: 4),
            //    Text(
            //      'Expires in 7 days (Oct 23, 2025)',
            //      style: TextStyle(
            //        fontSize: 13,
            //        color: AppColors.warning,
            //        fontWeight: FontWeight.w600,
            //      ),
            //    ),
            //  ],
            //                 ),
            const SizedBox(height: 24),

            const Text(
              'Available Plans',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Choose a plan that fits your fleet size',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),

            // Plans
            ...plans.map((plan) => _buildPlanCard(context, plan)),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(BuildContext context, SubscriptionPlan plan) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      plan.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (plan.isPopular)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'POPULAR',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      '₹',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      plan.price.toString(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '/month',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Track up to ${plan.vehicleCount} vehicles',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                ...plan.features.map((feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 18,
                            color: AppColors.success,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              feature,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showUpgradeDialog(context, plan);
                    },
                    child: plan.name == 'Business'
                        ? const Text('Renew Plan')
                        :  Text('Upgrade to ${plan.name}'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showUpgradeDialog(BuildContext context, SubscriptionPlan plan) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Upgrade to ${plan.name}'),
        content: Text(
          'Upgrade to ${plan.name} plan for ₹${plan.price}/month and track up to ${plan.vehicleCount} vehicles?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Redirecting to payment gateway...'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            child: const Text('Proceed to Payment'),
          ),
        ],
      ),
    );
  }
}
