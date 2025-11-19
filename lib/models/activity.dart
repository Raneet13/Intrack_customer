class Activity {
  final int id;
  final String vehicle;
  final String driver;
  final String activity;
  final String location;
  final String time;
  final ActivityStatus status;

  Activity({
    required this.id,
    required this.vehicle,
    required this.driver,
    required this.activity,
    required this.location,
    required this.time,
    required this.status,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      vehicle: json['vehicle'],
      driver: json['driver'],
      activity: json['activity'],
      location: json['location'],
      time: json['time'],
      status: ActivityStatus.fromString(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vehicle': vehicle,
      'driver': driver,
      'activity': activity,
      'location': location,
      'time': time,
      'status': status.toString(),
    };
  }
}

enum ActivityStatus {
  active,
  completed,
  stopped;

  static ActivityStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return ActivityStatus.active;
      case 'completed':
        return ActivityStatus.completed;
      case 'stopped':
        return ActivityStatus.stopped;
      default:
        return ActivityStatus.stopped;
    }
  }

  @override
  String toString() {
    switch (this) {
      case ActivityStatus.active:
        return 'active';
      case ActivityStatus.completed:
        return 'completed';
      case ActivityStatus.stopped:
        return 'stopped';
    }
  }
}
