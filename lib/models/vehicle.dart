class Vehicle {
  final String id;

  // Basic Info
  final String name;
  final String registrationNo;
  final String type;
  final String make;
  final String model;
  final String year;

  // Driver
  final String driverId;
  final String driverName;
  final String driverPhone;
  final String? driverLicense;

  // Location & Status
  final String status;
  final String lastLocation;
  final double? latitude;
  final double? longitude;

  // Metrics
  final double mileage;
  final double fuelLevel;
  final double speed;
  final double todayKm;
  final double totalKm;

  final String lastUpdate;

  // Subscription
  final bool subscriptionActive;
  final DateTime? subscriptionExpiry;
  final String? subscriptionPlan;

  // Device Details
  final bool deviceInstalled;
  final DeviceDetails? deviceDetails;

  Vehicle({
    required this.id,
    required this.name,
    String? registrationNo,
    String? plateNumber, // Legacy support
    String? registrationNumber, // Legacy support
    String? type,
    String? vehicleType, // Legacy support
    this.make = '',
    this.model = '',
    this.year = '',
    this.driverId = '',
    String? driverName,
    String? driver, // Legacy support
    this.driverPhone = '',
    this.driverLicense,
    required this.status,
    this.lastLocation = 'Unknown',
    this.latitude,
    this.longitude,
    this.mileage = 0.0,
    this.fuelLevel = 0.0,
    this.speed = 0.0,
    this.todayKm = 0.0,
    this.totalKm = 0.0,
    this.lastUpdate = '',
    String? lastService, // Legacy support (ignored or mapped)
    this.subscriptionActive = false,
    this.subscriptionExpiry,
    this.subscriptionPlan,
    this.deviceInstalled = false,
    this.deviceDetails,
  })  : this.registrationNo = registrationNo ?? registrationNumber ?? plateNumber ?? '',
        this.type = type ?? vehicleType ?? '',
        this.driverName = driverName ?? driver ?? '';

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('vehicle_id')) {
      final driverJson = json['driver'];
      final deviceDetailsJson = json['device_details'];

      return Vehicle(
        id: json['vehicle_id']?.toString() ?? '',
        name: json['vehicle_name'] ?? '',
        registrationNo: json['registration_no'] ?? '',
        type: json['vehicle_type']?.toString() ?? '',
        status: json['vehicle_status']?.toString() ?? '1',
        driverId: driverJson?['driver_id']?.toString() ?? '',
        driverName: driverJson?['driver_name'] ?? '',
        driverPhone: driverJson?['phone'] ?? '',
        driverLicense: driverJson?['license_no'],
        deviceInstalled: json['device_installed'] ?? false,
        deviceDetails: deviceDetailsJson != null
            ? DeviceDetails.fromJson(deviceDetailsJson)
            : null,
        lastLocation: 'Unknown',
        subscriptionActive: json['device_installed'] ?? false,
      );
    }

    return Vehicle(
      id: json["id"]?.toString() ?? "",
      name: json["name"] ?? "",
      registrationNo: json["registration_no"] ?? json["registrationNumber"] ?? json["plateNumber"] ?? "",
      type: json["type"] ?? json["vehicleType"] ?? "",
      make: json["make"] ?? "",
      model: json["model"] ?? "",
      year: json["year"]?.toString() ?? "",
      driverId: json["driverId"] ?? "",
      driverName: json["driverName"] ?? json["driver"] ?? "",
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
      subscriptionExpiry: json["subscriptionExpiry"] != null ? DateTime.parse(json["subscriptionExpiry"]) : null,
      subscriptionPlan: json["subscriptionPlan"],
    );
  }

  // Getters for compatibility
  String get plateNumber => registrationNo;
  String get registrationNumber => registrationNo;
  String get vehicleType => type;
  String get driver => driverName;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "registrationNo": registrationNo,
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
    };
  }
}

class DeviceDetails {
  final String? assignId;
  final String? deviceId;
  final String? deviceCode;
  final String? imeiNo;
  final String? deviceModel;
  final String? serialNo;
  final String? simNo;
  final String? deviceStatus;
  final List<InstallationImage> installationImages;

  DeviceDetails({
    this.assignId,
    this.deviceId,
    this.deviceCode,
    this.imeiNo,
    this.deviceModel,
    this.serialNo,
    this.simNo,
    this.deviceStatus,
    this.installationImages = const [],
  });

  factory DeviceDetails.fromJson(Map<String, dynamic> json) {
    var imagesList = json['installation_images'] as List?;
    List<InstallationImage> images = imagesList != null
        ? imagesList.map((i) => InstallationImage.fromJson(i)).toList()
        : [];

    return DeviceDetails(
      assignId: json['assign_id']?.toString(),
      deviceId: json['device_id']?.toString(),
      deviceCode: json['device_code'],
      imeiNo: json['imei_no'],
      deviceModel: json['device_model'],
      serialNo: json['serial_no'],
      simNo: json['sim_no'],
      deviceStatus: json['device_status']?.toString(),
      installationImages: images,
    );
  }
}

class InstallationImage {
  final String id;
  final String image;
  final String description;
  final String imageUrl;

  InstallationImage({
    required this.id,
    required this.image,
    required this.description,
    required this.imageUrl,
  });

  factory InstallationImage.fromJson(Map<String, dynamic> json) {
    return InstallationImage(
      id: json['id']?.toString() ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }
}
