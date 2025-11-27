import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/reports_screen.dart';
import '../theme/app_theme.dart';
import 'dashboard_screen.dart';
import 'vehicles_screen.dart';
import 'drivers_screen.dart';
import 'menu_screen.dart';

class MainScreen extends StatefulWidget {
   int currentIndex;
   MainScreen({required this.currentIndex, super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const VehiclesScreen(),
    const DriversScreen(),
    const ReportsScreen(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: widget.currentIndex,
          onTap: (index) {
            setState(() {
              widget.currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppTheme.primaryBlue,
          unselectedItemColor: AppTheme.textGray,
          selectedLabelStyle: AppTheme.caption.copyWith(
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: AppTheme.caption,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping_outlined),
              activeIcon: Icon(Icons.local_shipping),
              label: 'Vehicles',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              activeIcon: Icon(Icons.people),
              label: 'Drivers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment_outlined),
              activeIcon: Icon(Icons.assessment),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              activeIcon: Icon(Icons.menu_open),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}
