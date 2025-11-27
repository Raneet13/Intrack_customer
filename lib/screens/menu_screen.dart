import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/subscription_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  
                    children: [
                      Text("Menu",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("Manage your account and settings",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey, fontSize: 12),),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // ------------------- COMPANY CARD -------------------
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      )
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
                        child: const Icon(Icons.business, color: Colors.blue, size: 28),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Transport Solutions Pvt Ltd",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Business Plan • 10/25 vehicles",
                              style: TextStyle(fontSize: 13, color: Colors.grey),
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
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionPage()));
                  },
                  child: SettingsTile(
                    icon: Icons.credit_card,
                    iconColor: Colors.grey.shade800,
                    title: "Subscription",
                    subtitle: "Manage your plan and billing",
                  ),
                ),
        
                // const SizedBox(height: 18),
        
                // ------------------- SUPPORT & SETTINGS -------------------
                const SectionHeader("Support & Settings"),
               
                SettingsTile(
                  icon: Icons.notifications,
                  iconColor: Colors.grey.shade800,
                  title: "Notifications",
                  subtitle: "Alert settings and history",
                ),
                SettingsTile(
                  icon: Icons.help_outline,
                  iconColor: Colors.grey.shade800,
                  title: "Help & Support",
                  subtitle: "FAQs and customer support",
                ),
                SettingsTile(
                  icon: Icons.lock_outline,
                  iconColor: Colors.grey.shade800,
                  title: "Privacy Policy",
                  subtitle: "Data protection and privacy",
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom:8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffF2F4F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 3),
                Text(subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios,
              size: 18, color: Colors.grey),
        ],
      ),
    );
  }
}
