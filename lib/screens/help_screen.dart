import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';

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
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
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
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 16),

            // FAQ Items
            _buildFAQItem(
              question: 'How do I add a new vehicle?',
              answer:
                  'Go to the Vehicles tab, tap the "+" button, and fill in the vehicle details including registration number, make, model, and driver information.',
            ),
            _buildFAQItem(
              question: 'How can I track my vehicle in real-time?',
              answer:
                  'Tap on any vehicle from the Vehicles list and select "Track Vehicle" to see live location, speed, and route information on the map.',
            ),
            _buildFAQItem(
              question: 'How do I upgrade my subscription plan?',
              answer:
                  'Go to Menu > Subscription, view available plans, and select "Upgrade Plan" to choose a higher tier with more vehicles and features.',
            ),
            _buildFAQItem(
              question: 'Can I export vehicle reports?',
              answer:
                  'Yes! Go to the Reports tab, select your filters, and tap the "Export" button to download vehicle KM run data and device status reports.',
            ),
            _buildFAQItem(
              question: 'What should I do if a device goes offline?',
              answer:
                  'Check the device\'s power connection and ensure it has cellular connectivity. If the issue persists, contact our support team for assistance.',
            ),
            _buildFAQItem(
              question: 'How do I manage driver information?',
              answer:
                  'Go to the Drivers tab to view, add, edit, or remove drivers. You can assign vehicles to drivers and track their license details.',
            ),
            _buildFAQItem(
              question: 'Is my data secure?',
              answer:
                  'Yes! We use industry-standard encryption and follow strict data protection policies. View our Privacy Policy for more details.',
            ),

            const SizedBox(height: 24),

            // Quick Links Section
            const Text(
              'Quick Links',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: Column(
                children: [
                  _buildQuickLinkItem(
                    icon: Icons.description,
                    title: 'User Guide',
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  _buildQuickLinkItem(
                    icon: Icons.video_library,
                    title: 'Video Tutorials',
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  _buildQuickLinkItem(
                    icon: Icons.feedback,
                    title: 'Send Feedback',
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  _buildQuickLinkItem(
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
                    _buildContactRow(Icons.email, 'support@in-track.in'),
                    const SizedBox(height: 12),
                    _buildContactRow(Icons.phone, '+91 1800 123 4567'),
                    const SizedBox(height: 12),
                    _buildContactRow(Icons.access_time, 'Mon-Sat: 9 AM - 6 PM IST'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem({
    required String question,
    required String answer,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(
            question,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                answer,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickLinkItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.grey.shade600),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
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

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade600),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
