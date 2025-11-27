import 'package:flutter/foundation.dart';
import '../models/driver.dart';

class DriverProvider with ChangeNotifier {
  List<Driver> _drivers = [];
  
  List<Driver> get drivers => _drivers;
  
  int get totalDrivers => _drivers.length;
  int get activeDrivers => _drivers.where((d) => d.status == 'Active').length;
  int get onLeaveDrivers => _drivers.where((d) => d.status == 'On Leave').length;
  int get inactiveDrivers => _drivers.where((d) => d.status == 'Inactive').length;

  DriverProvider() {
    _loadMockData();
  }

  void _loadMockData() {
    _drivers = [
      Driver(
        id: '1',
        name: 'Rajesh Kumar',
        phone: '+91 98765 43210',
        email: 'rajesh.kumar@example.com',
        licenseNumber: 'MH0120190012345',
        licenseExpiry: DateTime.now().add(const Duration(days: 365)),
        address: 'Andheri East, Mumbai, Maharashtra',
        status: 'Active',
        currentVehicleId: '1',
        currentVehicleName: 'MH 12 AB 1234',
        joinDate: DateTime(2022, 3, 15),
        totalTrips: 487,
        totalKm: 45620.5,
        rating: 4.8, assignedVehicle: '', lastActive: '', totalKms: 12,
      ),
      Driver(
        id: '2',
        name: 'Amit Singh',
        phone: '+91 98765 43211',
        email: 'amit.singh@example.com',
        licenseNumber: 'DL0120200098765',
        licenseExpiry: DateTime.now().add(const Duration(days: 180)),
        address: 'Rohini, New Delhi, Delhi',
        status: 'Active',
        currentVehicleId: '2',
        currentVehicleName: 'DL 01 CD 5678',
        joinDate: DateTime(2021, 8, 22),
        totalTrips: 632,
        totalKm: 58900.0,
        rating: 4.6, assignedVehicle: '', lastActive: '', totalKms: 22,
      ),
      Driver(
        id: '3',
        name: 'Suresh Patil',
        phone: '+91 98765 43212',
        email: 'suresh.patil@example.com',
        licenseNumber: 'KA0320180067890',
        licenseExpiry: DateTime.now().add(const Duration(days: 90)),
        address: 'Whitefield, Bangalore, Karnataka',
        status: 'On Leave',
        currentVehicleId: '3',
        currentVehicleName: 'KA 03 EF 9012',
        joinDate: DateTime(2020, 5, 10),
        totalTrips: 523,
        totalKm: 49200.0,
        rating: 4.7, assignedVehicle: '', lastActive: '', totalKms: 34,
      ),
      Driver(
        id: '4',
        name: 'Vijay Mehta',
        phone: '+91 98765 43213',
        email: 'vijay.mehta@example.com',
        licenseNumber: 'GJ0120210054321',
        licenseExpiry: DateTime.now().add(const Duration(days: 540)),
        address: 'Satellite, Ahmedabad, Gujarat',
        status: 'Active',
        currentVehicleId: '4',
        currentVehicleName: 'GJ 01 GH 3456',
        joinDate: DateTime(2021, 1, 18),
        totalTrips: 712,
        totalKm: 67890.0,
        rating: 4.9, assignedVehicle: '', lastActive: '', totalKms: 43,
      ),
    
    ];
    notifyListeners();
  }

  Driver? getDriverById(String id) {
    try {
      return _drivers.firstWhere((d) => d.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Driver> getDriversByStatus(String status) {
    return _drivers.where((d) => d.status == status).toList();
  }

  void addDriver(Driver driver) {
    _drivers.add(driver);
    notifyListeners();
  }

  void updateDriver(Driver driver) {
    final index = _drivers.indexWhere((d) => d.id == driver.id);
    if (index != -1) {
      _drivers[index] = driver;
      notifyListeners();
    }
  }

  void deleteDriver(String id) {
    _drivers.removeWhere((d) => d.id == id);
    notifyListeners();
  }

  List<Driver> searchDrivers(String query) {
    if (query.isEmpty) return _drivers;
    
    return _drivers.where((driver) {
      return driver.name.toLowerCase().contains(query.toLowerCase()) ||
             driver.phone.contains(query) ||
             driver.licenseNumber.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  List<Driver> getDriversWithExpiringLicenses() {
    return _drivers.where((d) => d.isLicenseExpiring).toList();
  }

  List<Driver> getDriversWithExpiredLicenses() {
    return _drivers.where((d) => d.isLicenseExpired).toList();
  }
}
