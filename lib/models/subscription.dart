class Subscription {
  final String planName;
  final int vehicleCount;
  final int price;
  final String billingCycle;
  final String status;
  final DateTime expiryDate;
  final List<String> features;
  final bool isPopular;

  Subscription({
    required this.planName,
    required this.vehicleCount,
    required this.price,
    required this.billingCycle,
    required this.status,
    required this.expiryDate,
    required this.features,
    this.isPopular = false,
  });

  int get daysUntilExpiry {
    return expiryDate.difference(DateTime.now()).inDays;
  }

  bool get isExpiring {
    return daysUntilExpiry <= 7 && daysUntilExpiry > 0;
  }

  bool get isExpired {
    return daysUntilExpiry < 0;
  }

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      planName: json['planName'],
      vehicleCount: json['vehicleCount'],
      price: json['price'],
      billingCycle: json['billingCycle'],
      status: json['status'],
      expiryDate: DateTime.parse(json['expiryDate']),
      features: List<String>.from(json['features']),
      isPopular: json['isPopular'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'planName': planName,
      'vehicleCount': vehicleCount,
      'price': price,
      'billingCycle': billingCycle,
      'status': status,
      'expiryDate': expiryDate.toIso8601String(),
      'features': features,
      'isPopular': isPopular,
    };
  }
}

class SubscriptionPlan {
  final String name;
  final int vehicleCount;
  final int price;
  final List<String> features;
  final bool isPopular;

  SubscriptionPlan({
    required this.name,
    required this.vehicleCount,
    required this.price,
    required this.features,
    this.isPopular = false,
  });

  static List<SubscriptionPlan> getAllPlans() {
    return [
      SubscriptionPlan(
        name: 'Starter',
        vehicleCount: 3,
        price: 999,
        features: [
          'Track up to 3 vehicles',
          'Real-time GPS tracking',
          'Basic reports',
          'Email support',
        ],
      ),
      SubscriptionPlan(
        name: 'Business',
        vehicleCount: 10,
        price: 2499,
        isPopular: true,
        features: [
          'Track up to 10 vehicles',
          'Real-time GPS tracking',
          'Advanced reports',
          'Driver management',
          'Email & Chat support',
          'Route optimization',
        ],
      ),
      SubscriptionPlan(
        name: 'Professional',
        vehicleCount: 25,
        price: 4999,
        features: [
          'Track up to 25 vehicles',
          'Real-time GPS tracking',
          'Comprehensive reports',
          'Driver management',
          'Priority support',
          'Route optimization',
          'Fuel management',
          'Maintenance alerts',
        ],
      ),
      SubscriptionPlan(
        name: 'Enterprise',
        vehicleCount: 100,
        price: 9999,
        features: [
          'Track up to 100 vehicles',
          'Real-time GPS tracking',
          'Enterprise reports',
          'Advanced driver management',
          '24/7 Priority support',
          'Route optimization',
          'Fuel management',
          'Maintenance alerts',
          'API access',
          'Custom integrations',
        ],
      ),
    ];
  }
}
