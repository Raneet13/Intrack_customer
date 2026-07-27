import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DashboardProvider with ChangeNotifier {
  int _totalVehicles = 0;
  int _totalDrivers = 0;
  List<dynamic> _recentActivities = [];
  bool _isLoading = false;
  String? _errorMessage;

  int get totalVehicles => _totalVehicles;
  int get totalDrivers => _totalDrivers;
  List<dynamic> get recentActivities => _recentActivities;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final String _baseUrl = 'https://ointern.com/demo/intrack/UserApi';

  Future<void> fetchDashboardData(String userId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    debugPrint('Dashboard API: Fetching for user_id: $userId');

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/home'),
        body: {'user_id': userId},
      );

      debugPrint('Dashboard API Response: ${response.body}');

      final data = json.decode(response.body);
      if (data['status'] == true) {
        final dashboardData = data['data'];
        _totalVehicles = dashboardData['total_vehicles'] ?? 0;
        _totalDrivers = dashboardData['total_drivers'] ?? 0;
        _recentActivities = dashboardData['recent_activities'] ?? [];
        
        debugPrint('Dashboard API Success: Vehicles: $_totalVehicles, Drivers: $_totalDrivers, Activities: ${_recentActivities.length}');
      } else {
        _errorMessage = data['message'] ?? 'Failed to fetch dashboard data';
        debugPrint('Dashboard API Error: $_errorMessage');
      }
    } catch (e) {
      _errorMessage = 'Connection error: $e';
      debugPrint('Dashboard API Exception: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
