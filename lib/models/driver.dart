class Driver {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String licenseNumber;
  final String licenseExpiry;
  final String assignedVehicle;
  final DriverStatus status;
  final String joinDate;
  final String lastActive;
  final String? avatarUrl;
  final double? rating;
  final int? totalTrips;
  final int? totalKms;

  Driver({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.licenseNumber,
    required this.licenseExpiry,
    required this.assignedVehicle,
    required this.status,
    required this.joinDate,
    required this.lastActive,
    this.avatarUrl,
    this.rating,
    this.totalTrips,
    this.totalKms,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      licenseNumber: json['licenseNumber'],
      licenseExpiry: json['licenseExpiry'],
      assignedVehicle: json['assignedVehicle'],
      status: DriverStatus.fromString(json['status']),
      joinDate: json['joinDate'],
      lastActive: json['lastActive'],
      avatarUrl: json['avatarUrl'],
      rating: json['rating']?.toDouble(),
      totalTrips: json['totalTrips'],
      totalKms: json['totalKms'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'licenseNumber': licenseNumber,
      'licenseExpiry': licenseExpiry,
      'assignedVehicle': assignedVehicle,
      'status': status.toString(),
      'joinDate': joinDate,
      'lastActive': lastActive,
      'avatarUrl': avatarUrl,
      'rating': rating,
      'totalTrips': totalTrips,
      'totalKms': totalKms,
    };
  }

  String getInitials() {
    List<String> names = name.split(' ');
    if (names.length >= 2) {
      return '${names[0][0]}${names[1][0]}'.toUpperCase();
    }
    return name.substring(0, 2).toUpperCase();
  }

  Driver copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? licenseNumber,
    String? licenseExpiry,
    String? assignedVehicle,
    DriverStatus? status,
    String? joinDate,
    String? lastActive,
    String? avatarUrl,
    double? rating,
    int? totalTrips,
    int? totalKms,
  }) {
    return Driver(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      licenseExpiry: licenseExpiry ?? this.licenseExpiry,
      assignedVehicle: assignedVehicle ?? this.assignedVehicle,
      status: status ?? this.status,
      joinDate: joinDate ?? this.joinDate,
      lastActive: lastActive ?? this.lastActive,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      rating: rating ?? this.rating,
      totalTrips: totalTrips ?? this.totalTrips,
      totalKms: totalKms ?? this.totalKms,
    );
  }
}

enum DriverStatus {
  active,
  inactive,
  onLeave;

  static DriverStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return DriverStatus.active;
      case 'inactive':
        return DriverStatus.inactive;
      case 'on leave':
        return DriverStatus.onLeave;
      default:
        return DriverStatus.inactive;
    }
  }

  @override
  String toString() {
    switch (this) {
      case DriverStatus.active:
        return 'Active';
      case DriverStatus.inactive:
        return 'Inactive';
      case DriverStatus.onLeave:
        return 'On Leave';
    }
  }
}
