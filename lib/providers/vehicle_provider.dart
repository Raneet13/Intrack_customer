import 'package:flutter/foundation.dart';
import '../models/vehicle.dart';

class VehicleProvider with ChangeNotifier {
  List<Vehicle> _vehicles = [];
  
  List<Vehicle> get vehicles => _vehicles;
  
  int get totalVehicles => _vehicles.length;
  int get activeVehicles => _vehicles.where((v) => v.status == 'active').length;
  int get idleVehicles => _vehicles.where((v) => v.status == 'idle').length;
  int get inactiveVehicles => _vehicles.where((v) => v.status == 'inactive').length;

  VehicleProvider() {
    _loadMockData();
  }

  void _loadMockData() {
    _vehicles = [
      Vehicle(
        id: '1',
        registrationNumber: 'MH 12 AB 1234',
        vehicleType: 'Truck',
        model: 'Tata LPT 1613',
        driverId: '1',
        driverName: 'Rajesh Kumar',
        status: 'active',
        latitude: 19.0760,
        longitude: 72.8777,
        speed: 45.5,
        todayKm: 156.8,
        totalKm: 45620.5,
        lastUpdate: '2 mins ago',
        subscriptionActive: true,
        subscriptionExpiry: DateTime.now().add(const Duration(days: 45)),
        subscriptionPlan: 'Professional', name: '', plateNumber: '', make: '', year: '', driverPhone: '', type: '', lastLocation: '', mileage: 12.0, fuelLevel: 70, driver: '', lastService: '',
      ),
      Vehicle(
        id: '2',
        registrationNumber: 'DL 01 CD 5678',
        vehicleType: 'Tempo',
        model: 'Mahindra Bolero Pickup',
        driverId: '2',
        driverName: 'Amit Singh',
        status: 'idle',
        latitude: 28.7041,
        longitude: 77.1025,
        speed: 0,
        todayKm: 89.2,
        totalKm: 23450.0,
        lastUpdate: '15 mins ago',
        subscriptionActive: true,
        subscriptionExpiry: DateTime.now().add(const Duration(days: 20)),
        subscriptionPlan: 'Business', name: '', plateNumber: 'MH12AB1234', make: '21/09/2024', year: '2024', driverPhone: 'dibyajyoti', type: '', lastLocation: '', mileage: 12 , fuelLevel: 70, driver: '', lastService: '',
      ),
      Vehicle(
        id: '3',
        registrationNumber: 'KA 03 EF 9012',
        vehicleType: 'Mini Truck',
        model: 'Ashok Leyland Dost',
        driverId: '3',
        driverName: 'Suresh Patil',
        status: 'inactive',
        latitude: 12.9716,
        longitude: 77.5946,
        speed: 0,
        todayKm: 0,
        totalKm: 18900.0,
        lastUpdate: '3 hours ago',
        subscriptionActive: false,
        subscriptionExpiry: DateTime.now().subtract(const Duration(days: 5)),
        subscriptionPlan: 'Starter', name: '', plateNumber: '', make: '', year: '', driverPhone: '', type: '', lastLocation: '', mileage: 12, fuelLevel: 80, driver: '', lastService: '',
      ),
      Vehicle(
        id: '4',
        registrationNumber: 'GJ 01 GH 3456',
        vehicleType: 'Truck',
        model: 'Eicher Pro 2049',
        driverId: '4',
        driverName: 'Vijay Mehta',
        status: 'active',
        latitude: 23.0225,
        longitude: 72.5714,
        speed: 62.3,
        todayKm: 234.5,
        totalKm: 67890.0,
        lastUpdate: 'Just now',
        subscriptionActive: true,
        subscriptionExpiry: DateTime.now().add(const Duration(days: 90)),
        subscriptionPlan: 'Enterprise', name: '', plateNumber: '', make: '', year: '', driverPhone: '', type: '', lastLocation: '', mileage: 12, fuelLevel: 80, driver: '', lastService: '',
      ),
    ];
    notifyListeners();
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
      return vehicle.registrationNumber.toLowerCase().contains(query.toLowerCase()) ||
             vehicle.driverName.toLowerCase().contains(query.toLowerCase()) ||
             vehicle.vehicleType.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
