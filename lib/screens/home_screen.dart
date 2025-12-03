import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import 'dashboard_screen/dashboard_screen.dart';
import 'vehicles_screen/vehicles_screen.dart';
import 'drivers_screen/drivers_screen.dart';
import 'reports_screen/reports_screen.dart';
import 'menu_screen/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const VehiclesScreen(),
    const DriversScreen(),
    const ReportsScreen(),
    const MenuScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}
