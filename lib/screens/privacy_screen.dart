import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const MobileHeader(
        title: 'Privacy Policy',
        subtitle: 'Data protection and privacy',
        canGoBack: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.shield, size: 32, color: AppColors.primary),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Privacy Matters',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Last updated: October 29, 2025',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
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
            ),

            const SizedBox(height: 16),

            _buildSection(
              title: '1. Information We Collect',
              content:
                  'We collect information that you provide directly to us, including:\n\n'
                  '• Account information (name, email, phone number)\n'
                  '• Vehicle details (registration numbers, make, model)\n'
                  '• Driver information (names, license details)\n'
                  '• Location data from GPS tracking devices\n'
                  '• Usage data and analytics\n\n'
                  'This information is necessary to provide our fleet management services.',
            ),

            _buildSection(
              title: '2. How We Use Your Information',
              content:
                  'We use the collected information for:\n\n'
                  '• Providing real-time vehicle tracking services\n'
                  '• Generating reports and analytics\n'
                  '• Managing your subscription and billing\n'
                  '• Sending important notifications and updates\n'
                  '• Improving our services and user experience\n'
                  '• Ensuring the security of our platform',
            ),

            _buildSection(
              title: '3. Data Storage and Security',
              content:
                  'Your data is stored securely on servers located in India. We implement industry-standard security measures including:\n\n'
                  '• Encryption of data in transit and at rest\n'
                  '• Regular security audits and updates\n'
                  '• Access controls and authentication\n'
                  '• Secure backup and recovery systems\n\n'
                  'We comply with Indian data protection laws and regulations.',
            ),

            _buildSection(
              title: '4. Data Sharing',
              content:
                  'We do not sell or rent your personal information to third parties. We may share your data only in the following cases:\n\n'
                  '• With your explicit consent\n'
                  '• To comply with legal obligations\n'
                  '• With service providers who assist in our operations (under strict confidentiality agreements)\n'
                  '• In case of business transfers (mergers, acquisitions)',
            ),

            _buildSection(
              title: '5. Your Rights',
              content:
                  'You have the right to:\n\n'
                  '• Access your personal data\n'
                  '• Correct inaccurate data\n'
                  '• Request deletion of your data\n'
                  '• Export your data\n'
                  '• Withdraw consent for data processing\n'
                  '• Lodge complaints with regulatory authorities\n\n'
                  'Contact our support team to exercise these rights.',
            ),

            _buildSection(
              title: '6. Location Data',
              content:
                  'Our service requires collecting and processing location data from your vehicles. This data is used exclusively for:\n\n'
                  '• Real-time vehicle tracking\n'
                  '• Route optimization\n'
                  '• Historical trip data\n'
                  '• Geofencing and alerts\n\n'
                  'You can disable location tracking at any time through app settings.',
            ),

            _buildSection(
              title: '7. Cookies and Tracking',
              content:
                  'We use cookies and similar technologies to:\n\n'
                  '• Keep you logged in\n'
                  '• Remember your preferences\n'
                  '• Analyze app usage\n'
                  '• Improve performance\n\n'
                  'You can control cookie settings through your browser or device settings.',
            ),

            _buildSection(
              title: '8. Children\'s Privacy',
              content:
                  'Our services are not intended for individuals under the age of 18. We do not knowingly collect personal information from children.',
            ),

            _buildSection(
              title: '9. Changes to This Policy',
              content:
                  'We may update this privacy policy from time to time. We will notify you of any significant changes through:\n\n'
                  '• In-app notifications\n'
                  '• Email notifications\n'
                  '• Updates on our website\n\n'
                  'Continued use of our services after changes constitutes acceptance of the updated policy.',
            ),

            _buildSection(
              title: '10. Contact Us',
              content:
                  'If you have any questions or concerns about our privacy policy, please contact us:\n\n'
                  'Email: privacy@in-track.in\n'
                  'Phone: +91 1800 123 4567\n'
                  'Address: IN-Track India Pvt Ltd, Pune, Maharashtra',
            ),

            const SizedBox(height: 24),

            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.verified_user, color: AppColors.primary),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'We are committed to protecting your privacy and maintaining the security of your data.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
