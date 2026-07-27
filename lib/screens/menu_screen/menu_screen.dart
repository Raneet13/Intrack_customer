import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../subscription_screen/subscription_screen.dart';
import '../help_screen/help_screen.dart';
import '../notifications_screen/notifications_screen.dart';
import '../privacy_screen.dart';
import 'widgets/section_header.dart';
import 'widgets/settings_tile.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Menu",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Manage your account and settings",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // ------------------- USER CARD -------------------
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xffEBF3FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.blue,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              authProvider.userName ?? "User",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              authProvider.userEmail ?? authProvider.phoneNumber ?? "",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ------------------- ACCOUNT & BILLING -------------------
                const SectionHeader("Account & Billing"),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SubscriptionPage(),
                      ),
                    );
                  },
                  child: SettingsTile(
                    icon: Icons.credit_card,
                    iconColor: Colors.grey.shade800,
                    title: "Subscription",
                    subtitle: "Manage your plan and billing",
                  ),
                ),

                // ------------------- SUPPORT & SETTINGS -------------------
                const SectionHeader("Support & Settings"),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    );
                  },
                  child: SettingsTile(
                    icon: Icons.notifications,
                    iconColor: Colors.grey.shade800,
                    title: "Notifications",
                    subtitle: "Alert settings and history",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelpScreen(),
                      ),
                    );
                  },
                  child: const SettingsTile(
                    icon: Icons.help_outline,
                    iconColor: Color(0xFF424242),
                    title: "Help & Support",
                    subtitle: "FAQs and customer support",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyScreen(),
                      ),
                    );
                  },
                  child: const SettingsTile(
                    icon: Icons.lock_outline,
                    iconColor: Color(0xFF424242),
                    title: "Privacy Policy",
                    subtitle: "Data protection and privacy",
                  ),
                ),

                const SizedBox(height: 20),
                
                // ------------------- LOGOUT -------------------
                InkWell(
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                  child: const SettingsTile(
                    icon: Icons.logout,
                    iconColor: Colors.redAccent,
                    title: "Logout",
                    subtitle: "Sign out of your account",
                  ),
                ),

                const SizedBox(height: 30),

                // ------------------- FOOTER -------------------
                const Center(
                  child: Column(
                    children: [
                      Text(
                        "IN-Track v2.1.0",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Made in India 🇮🇳 for Indian Transport Companies",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                context.read<AuthProvider>().logout();
              },
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
