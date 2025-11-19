class Vehicle {
  final int id;
  final String name;
  final String type;
  final String make;
  final String model;
  final int year;
  final String plateNumber;
  final String driver;
  final String driverPhone;
  final VehicleStatus status;
  final String lastLocation;
  final int? mileage;
  final int? fuelLevel;
  final String? lastService;
  final double? latitude;
  final double? longitude;
  final int? speed;

  Vehicle({
    required this.id,
    required this.name,
    required this.type,
    required this.make,
    required this.model,
    required this.year,
    required this.plateNumber,
    required this.driver,
    required this.driverPhone,
    required this.status,
    required this.lastLocation,
    this.mileage,
    this.fuelLevel,
    this.lastService,
    this.latitude,
    this.longitude,
    this.speed,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      plateNumber: json['plateNumber'],
      driver: json['driver'],
      driverPhone: json['driverPhone'],
      status: VehicleStatus.fromString(json['status']),
      lastLocation: json['lastLocation'],
      mileage: json['mileage'],
      fuelLevel: json['fuelLevel'],
      lastService: json['lastService'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      speed: json['speed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'make': make,
      'model': model,
      'year': year,
      'plateNumber': plateNumber,
      'driver': driver,
      'driverPhone': driverPhone,
      'status': status.toString(),
      'lastLocation': lastLocation,
      'mileage': mileage,
      'fuelLevel': fuelLevel,
      'lastService': lastService,
      'latitude': latitude,
      'longitude': longitude,
      'speed': speed,
    };
  }

  Vehicle copyWith({
    int? id,
    String? name,
    String? type,
    String? make,
    String? model,
    int? year,
    String? plateNumber,
    String? driver,
    String? driverPhone,
    VehicleStatus? status,
    String? lastLocation,
    int? mileage,
    int? fuelLevel,
    String? lastService,
    double? latitude,
    double? longitude,
    int? speed,
  }) {
    return Vehicle(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      make: make ?? this.make,
      model: model ?? this.model,
      year: year ?? this.year,
      plateNumber: plateNumber ?? this.plateNumber,
      driver: driver ?? this.driver,
      driverPhone: driverPhone ?? this.driverPhone,
      status: status ?? this.status,
      lastLocation: lastLocation ?? this.lastLocation,
      mileage: mileage ?? this.mileage,
      fuelLevel: fuelLevel ?? this.fuelLevel,
      lastService: lastService ?? this.lastService,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      speed: speed ?? this.speed,
    );
  }
}

enum VehicleStatus {
  active,
  inactive,
  maintenance;

  static VehicleStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return VehicleStatus.active;
      case 'inactive':
        return VehicleStatus.inactive;
      case 'maintenance':
        return VehicleStatus.maintenance;
      default:
        return VehicleStatus.inactive;
    }
  }

  @override
  String toString() {
    switch (this) {
      case VehicleStatus.active:
        return 'Active';
      case VehicleStatus.inactive:
        return 'Inactive';
      case VehicleStatus.maintenance:
        return 'Maintenance';
    }
  }
}
