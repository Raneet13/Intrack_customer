import '../models/vehicle.dart';
import '../models/driver.dart';
import '../models/activity.dart';

class MockData {
  static List<Vehicle> getVehicles() {
    return [
      Vehicle(
        id: '1',
        name: 'Fleet Truck 1',
        type: 'Truck',
        make: 'Tata',
        model: 'LPT 1613',
        year: '2022',
        plateNumber: 'MH12AB1234',
        driver: 'Raj Sharma',
        driverPhone: '+91 98765 43210',
        status: 'active',
        lastLocation: 'Mumbai',
        mileage: 48520,
        fuelLevel: 85,
        lastService: '15 days ago',
        latitude: 19.0760,
        longitude: 72.8777,
        speed: 65, driverId: '', driverName: '', todayKm: 34, totalKm: 34, lastUpdate: '', subscriptionActive: true, registrationNumber: '', vehicleType: '',
      ),
      Vehicle(
        id: '2',
        name: 'City Car 1',
        type: 'Car',
        make: 'Maruti',
        model: 'Dzire',
        year: '2021',
        plateNumber: 'KA05CD5678',
        driver: 'Anil Kumar',
        driverPhone: '+91 87654 32109',
        status: 'active',
        lastLocation: 'Bangalore',
        mileage: 32150,
        fuelLevel: 62,
        lastService: '8 days ago',
        latitude: 12.9716,
        longitude: 77.5946,
        speed: 0, driverId: '', driverName: '', todayKm: 55, totalKm: 55, lastUpdate: '', subscriptionActive: false, registrationNumber: '', vehicleType: '',
      ),
    
    ];
  }

  static List<Driver> getDrivers() {
    return [
      Driver(
        id: '1',
        name: 'Raj Sharma',
        email: 'raj.sharma@company.com',
        phone: '+91 98765 43210',
        licenseNumber: 'MH1420110012345',
        licenseExpiry: DateTime.now(),
        assignedVehicle: 'MH12AB1234',
        status:'active',
        joinDate: DateTime.now(),
        lastActive: '2025-01-15 14:30',
        rating: 4.5,
        totalTrips: 342,
        totalKms: 48520, address: '', totalKm: 33,
      ),
      
      
    ];
  }

  static List<Activity> getRecentActivities() {
    return [
      Activity(
        id: 1,
        vehicle: 'MH12AB1234',
        driver: 'Raj Sharma',
        activity: 'Trip started',
        location: 'Mumbai',
        time: '2 mins ago',
        status: ActivityStatus.active,
      ),
      Activity(
        id: 2,
        vehicle: 'KA05CD5678',
        driver: 'Anil Kumar',
        activity: 'Reached destination',
        location: 'Bangalore',
        time: '15 mins ago',
        status: ActivityStatus.completed,
      ),
      Activity(
        id: 3,
        vehicle: 'GJ01EF9012',
        driver: 'Vikas Patel',
        activity: 'Vehicle stopped',
        location: 'Ahmedabad',
        time: '1 hour ago',
        status: ActivityStatus.stopped,
      ),
    ];
  }

  static Map<String, int> getFleetStats() {
    return {
      'totalVehicles': 24,
      'activeVehicles': 18,
      'inactiveVehicles': 6,
      'totalKms': 125840,
      'alerts': 2,
    };
  }
}
