class Driver {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String licenseNumber;
  final DateTime licenseExpiry;
  final String address;
  final String status;
  final String? currentVehicleId;
  final String? currentVehicleName;
  final String? profileImage;
  final DateTime joinDate;
  final int totalTrips;
  final double totalKm;
  final double rating;

  Driver({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.licenseNumber,
    required this.licenseExpiry,
    required this.address,
    required this.status,
    this.currentVehicleId,
    this.currentVehicleName,
    this.profileImage,
    required this.joinDate,
    required this.totalTrips,
    required this.totalKm,
    required this.rating, required String assignedVehicle, required String lastActive, required int totalKms,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      licenseNumber: json['licenseNumber'],
      licenseExpiry: DateTime.parse(json['licenseExpiry']),
      address: json['address'],
      status: json['status'],
      currentVehicleId: json['currentVehicleId'],
      currentVehicleName: json['currentVehicleName'],
      profileImage: json['profileImage'],
      joinDate: DateTime.parse(json['joinDate']),
      totalTrips: json['totalTrips'] ?? 0,
      totalKm: json['totalKm']?.toDouble() ?? 0.0,
      rating: json['rating']?.toDouble() ?? 0.0, assignedVehicle: '', lastActive: '', totalKms: 22,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'licenseNumber': licenseNumber,
      'licenseExpiry': licenseExpiry.toIso8601String(),
      'address': address,
      'status': status,
      'currentVehicleId': currentVehicleId,
      'currentVehicleName': currentVehicleName,
      'profileImage': profileImage,
      'joinDate': joinDate.toIso8601String(),
      'totalTrips': totalTrips,
      'totalKm': totalKm,
      'rating': rating,
    };
  }

  Driver copyWith({
    String? name,
    String? phone,
    String? email,
    String? licenseNumber,
    DateTime? licenseExpiry,
    String? address,
    String? status,
    String? currentVehicleId,
    String? currentVehicleName,
    String? profileImage,
    int? totalTrips,
    double? totalKm,
    double? rating,
  }) {
    return Driver(
      id: id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      licenseExpiry: licenseExpiry ?? this.licenseExpiry,
      address: address ?? this.address,
      status: status ?? this.status,
      currentVehicleId: currentVehicleId ?? this.currentVehicleId,
      currentVehicleName: currentVehicleName ?? this.currentVehicleName,
      profileImage: profileImage ?? this.profileImage,
      joinDate: joinDate,
      totalTrips: totalTrips ?? this.totalTrips,
      totalKm: totalKm ?? this.totalKm,
      rating: rating ?? this.rating, assignedVehicle: '', lastActive: '', totalKms: 22,
    );
  }

  bool get isLicenseExpiring {
    final daysUntilExpiry = licenseExpiry.difference(DateTime.now()).inDays;
    return daysUntilExpiry <= 30 && daysUntilExpiry > 0;
  }

  bool get isLicenseExpired {
    return licenseExpiry.isBefore(DateTime.now());
  }
}
