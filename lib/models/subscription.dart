class SubscriptionPlan {
  final String id;
  final String name;
  final int vehicleCount;
  final double monthlyPrice;
  final double yearlyPrice;
  final List<String> features;
  final bool isPopular;

  SubscriptionPlan({
    required this.id,
    required this.name,
    required this.vehicleCount,
    required this.monthlyPrice,
    required this.yearlyPrice,
    required this.features,
    this.isPopular = false,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json['id'],
      name: json['name'],
      vehicleCount: json['vehicleCount'],
      monthlyPrice: json['monthlyPrice'].toDouble(),
      yearlyPrice: json['yearlyPrice'].toDouble(),
      features: List<String>.from(json['features']),
      isPopular: json['isPopular'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'vehicleCount': vehicleCount,
      'monthlyPrice': monthlyPrice,
      'yearlyPrice': yearlyPrice,
      'features': features,
      'isPopular': isPopular,
    };
  }
}

class UserSubscription {
  final String id;
  final String planId;
  final String planName;
  final int vehicleCount;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;
  final String billingCycle;
  final double amount;

  UserSubscription({
    required this.id,
    required this.planId,
    required this.planName,
    required this.vehicleCount,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.billingCycle,
    required this.amount,
  });

  bool get isExpired => endDate.isBefore(DateTime.now());
  
  int get daysRemaining => isActive ? endDate.difference(DateTime.now()).inDays : 0;

  factory UserSubscription.fromJson(Map<String, dynamic> json) {
    return UserSubscription(
      id: json['id'],
      planId: json['planId'],
      planName: json['planName'],
      vehicleCount: json['vehicleCount'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      isActive: json['isActive'],
      billingCycle: json['billingCycle'],
      amount: json['amount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'planId': planId,
      'planName': planName,
      'vehicleCount': vehicleCount,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'isActive': isActive,
      'billingCycle': billingCycle,
      'amount': amount,
    };
  }
}
