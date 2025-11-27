class Vehicle {
  final String id;

  // Basic Info
  final String name;
  final String plateNumber;
  final String type;                // Car, Truck, Van etc.
  final String make;
  final String model;
  final String year;

  // Driver
  final String driverId;
  final String driverName;
  final String driverPhone;

  // Location & Status
  final String status;
  final String lastLocation;        // NEW: "Mumbai", "Bangalore"
  final double? latitude;
  final double? longitude;

  // Metrics
  final double mileage;             // NEW
  final double fuelLevel;           // NEW (in %)
  final double speed;
  final double todayKm;
  final double totalKm;

  final String lastUpdate;

  // Subscription
  final bool subscriptionActive;
  final DateTime? subscriptionExpiry;
  final String? subscriptionPlan;

  var vehicleType;

  Vehicle({
    required this.id,
    required this.name,
    required this.plateNumber,
    required this.type,
    required this.make,
    required this.model,
    required this.year,
    required this.driverId,
    required this.driverName,
    required this.driverPhone,
    required this.status,
    required this.lastLocation,
    this.latitude,
    this.longitude,
    required this.mileage,
    required this.fuelLevel,
    required this.speed,
    required this.todayKm,
    required this.totalKm,
    required this.lastUpdate,
    required this.subscriptionActive,
    this.subscriptionExpiry,
    this.subscriptionPlan, required String registrationNumber, required String vehicleType, required String driver, required String lastService,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json["id"],
      name: json["name"] ?? "",
      plateNumber: json["plateNumber"] ?? json["registrationNumber"] ?? "",
      type: json["type"] ?? json["vehicleType"] ?? "",
      make: json["make"] ?? "",
      model: json["model"] ?? "",
      year: json["year"]?.toString() ?? "",
      driverId: json["driverId"] ?? "",
      driverName: json["driverName"] ?? "",
      driverPhone: json["driverPhone"] ?? "",
      status: json["status"] ?? "",
      lastLocation: json["lastLocation"] ?? "Unknown",
      latitude: json["latitude"],
      longitude: json["longitude"],
      mileage: (json["mileage"] ?? json["totalKm"] ?? 0).toDouble(),
      fuelLevel: (json["fuelLevel"] ?? 0).toDouble(),
      speed: (json["speed"] ?? 0).toDouble(),
      todayKm: (json["todayKm"] ?? 0).toDouble(),
      totalKm: (json["totalKm"] ?? 0).toDouble(),
      lastUpdate: json["lastUpdate"] ?? "",
      subscriptionActive: json["subscriptionActive"] ?? false,
      subscriptionExpiry: json["subscriptionExpiry"] != null
          ? DateTime.parse(json["subscriptionExpiry"])
          : null,
      subscriptionPlan: json["subscriptionPlan"], registrationNumber: '', vehicleType: '', driver: '', lastService: '',
    );
  }

  get registrationNumber => null;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "plateNumber": plateNumber,
      "type": type,
      "make": make,
      "model": model,
      "year": year,
      "driverId": driverId,
      "driverName": driverName,
      "driverPhone": driverPhone,
      "status": status,
      "lastLocation": lastLocation,
      "latitude": latitude,
      "longitude": longitude,
      "mileage": mileage,
      "fuelLevel": fuelLevel,
      "speed": speed,
      "todayKm": todayKm,
      "totalKm": totalKm,
      "lastUpdate": lastUpdate,
      "subscriptionActive": subscriptionActive,
      "subscriptionExpiry": subscriptionExpiry?.toIso8601String(),
      "subscriptionPlan": subscriptionPlan,
    };
  }

  Vehicle copyWith({
    String? name,
    String? plateNumber,
    String? type,
    String? make,
    String? model,
    String? year,
    String? driverId,
    String? driverName,
    String? driverPhone,
    String? status,
    String? lastLocation,
    double? latitude,
    double? longitude,
    double? mileage,
    double? fuelLevel,
    double? speed,
    double? todayKm,
    double? totalKm,
    String? lastUpdate,
    bool? subscriptionActive,
    DateTime? subscriptionExpiry,
    String? subscriptionPlan,
  }) {
    return Vehicle(
      id: id,
      name: name ?? this.name,
      plateNumber: plateNumber ?? this.plateNumber,
      type: type ?? this.type,
      make: make ?? this.make,
      model: model ?? this.model,
      year: year ?? this.year,
      driverId: driverId ?? this.driverId,
      driverName: driverName ?? this.driverName,
      driverPhone: driverPhone ?? this.driverPhone,
      status: status ?? this.status,
      lastLocation: lastLocation ?? this.lastLocation,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      mileage: mileage ?? this.mileage,
      fuelLevel: fuelLevel ?? this.fuelLevel,
      speed: speed ?? this.speed,
      todayKm: todayKm ?? this.todayKm,
      totalKm: totalKm ?? this.totalKm,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      subscriptionActive: subscriptionActive ?? this.subscriptionActive,
      subscriptionExpiry: subscriptionExpiry ?? this.subscriptionExpiry,
      subscriptionPlan: subscriptionPlan ?? this.subscriptionPlan, registrationNumber: '', vehicleType: '', driver: '', lastService: '',
    );
  }
}
