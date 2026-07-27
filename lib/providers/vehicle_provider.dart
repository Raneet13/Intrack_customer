import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/vehicle.dart';

class VehicleProvider with ChangeNotifier {
  List<Vehicle> _vehicles = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Vehicle> get vehicles => _vehicles;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  int get totalVehicles => _vehicles.length;
  
  // Updated to support both API status '1' and mock status 'active'
  int get activeVehicles => _vehicles.where((v) => v.status == '1' || v.status == 'active').length;
  int get inactiveVehicles => _vehicles.where((v) => v.status == '0' || v.status == 'inactive').length;
  int get idleVehicles => _vehicles.where((v) => v.status == 'idle').length;

  final String _baseUrl = 'https://ointern.com/demo/intrack/UserApi';

  Future<void> fetchVehicles(String userId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    debugPrint('Vehicle API: Fetching for user_id: $userId');

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/vehicle_by_customer'),
        body: {'user_id': userId},
      );

      debugPrint('Vehicle API Status: ${response.statusCode}');
      debugPrint('Vehicle API Response Body: ${response.body}');

      final data = json.decode(response.body);
      if (data['status'] == true) {
        final List<dynamic> vehicleList = data['data'];
        _vehicles = vehicleList.map((json) => Vehicle.fromJson(json)).toList();
        debugPrint('Vehicle API Success: Loaded ${_vehicles.length} vehicles');
      } else {
        _errorMessage = data['message'] ?? 'Failed to fetch vehicles';
        debugPrint('Vehicle API Error Message: $_errorMessage');
      }
    } catch (e) {
      _errorMessage = 'Connection error: $e';
      debugPrint('Vehicle API Exception: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Vehicle? getVehicleById(String id) {
    try {
      return _vehicles.firstWhere((v) => v.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Vehicle> getVehiclesByStatus(String status) {
    return _vehicles.where((v) => v.status == status).toList();
  }

  void addVehicle(Vehicle vehicle) {
    _vehicles.add(vehicle);
    notifyListeners();
  }

  void updateVehicle(Vehicle vehicle) {
    final index = _vehicles.indexWhere((v) => v.id == vehicle.id);
    if (index != -1) {
      _vehicles[index] = vehicle;
      notifyListeners();
    }
  }

  void deleteVehicle(String id) {
    _vehicles.removeWhere((v) => v.id == id);
    notifyListeners();
  }

  double getTodayTotalKm() {
    return _vehicles.fold(0.0, (sum, vehicle) => sum + vehicle.todayKm);
  }

  List<Vehicle> searchVehicles(String query) {
    if (query.isEmpty) return _vehicles;

    return _vehicles.where((vehicle) {
      return vehicle.registrationNo.toLowerCase().contains(query.toLowerCase()) ||
          vehicle.driverName.toLowerCase().contains(query.toLowerCase()) ||
          vehicle.type.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
