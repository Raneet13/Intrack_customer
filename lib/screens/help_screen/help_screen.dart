import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/mobile_header.dart';
import 'widgets/faq_item.dart';
import 'widgets/quick_link_item.dart';
import 'widgets/contact_row.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const MobileHeader(
        title: 'Help & Support',
        subtitle: 'FAQs and customer support',
        canGoBack: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contact Support Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.support_agent,
                      size: 48,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Need Help?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Our support team is here to help you 24/7',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.phone, size: 18),
                            label: const Text('Call Us'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.chat, size: 18),
                            label: const Text('Live Chat'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 16),

            // FAQ Items
            FAQItem(
              question: 'How do I add a new vehicle?',
              answer:
                  'Go to the Vehicles tab, tap the "+" button, and fill in the vehicle details including registration number, make, model, and driver information.',
            ),
            FAQItem(
              question: 'How can I track my vehicle in real-time?',
              answer:
                  'Tap on any vehicle from the Vehicles list and select "Track Vehicle" to see live location, speed, and route information on the map.',
            ),
            FAQItem(
              question: 'How do I upgrade my subscription plan?',
              answer:
                  'Go to Menu > Subscription, view available plans, and select "Upgrade Plan" to choose a higher tier with more vehicles and features.',
            ),
            FAQItem(
              question: 'Can I export vehicle reports?',
              answer:
                  'Yes! Go to the Reports tab, select your filters, and tap the "Export" button to download vehicle KM run data and device status reports.',
            ),
            FAQItem(
              question: 'What should I do if a device goes offline?',
              answer:
                  'Check the device\'s power connection and ensure it has cellular connectivity. If the issue persists, contact our support team for assistance.',
            ),
            FAQItem(
              question: 'How do I manage driver information?',
              answer:
                  'Go to the Drivers tab to view, add, edit, or remove drivers. You can assign vehicles to drivers and track their license details.',
            ),
            FAQItem(
              question: 'Is my data secure?',
              answer:
                  'Yes! We use industry-standard encryption and follow strict data protection policies. View our Privacy Policy for more details.',
            ),

            const SizedBox(height: 24),

            // Quick Links Section
            const Text(
              'Quick Links',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 12),

            Card(
              child: Column(
                children: [
                  QuickLinkItem(
                    icon: Icons.description,
                    title: 'User Guide',
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  QuickLinkItem(
                    icon: Icons.video_library,
                    title: 'Video Tutorials',
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  QuickLinkItem(
                    icon: Icons.feedback,
                    title: 'Send Feedback',
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  QuickLinkItem(
                    icon: Icons.bug_report,
                    title: 'Report a Problem',
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Contact Information
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Contact Information',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ContactRow(icon: Icons.email, text: 'support@in-track.in'),
                    const SizedBox(height: 12),
                    ContactRow(icon: Icons.phone, text: '+91 1800 123 4567'),
                    const SizedBox(height: 12),
                    ContactRow(
                      icon: Icons.access_time,
                      text: 'Mon-Sat: 9 AM - 6 PM IST',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
