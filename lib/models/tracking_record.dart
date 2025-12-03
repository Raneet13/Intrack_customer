class TrackingRecord {
  final String date;
  final String time;
  final String location;
  final String kmReading;
  final String speed;
  final String status;

  TrackingRecord({
    required this.date,
    required this.time,
    required this.location,
    required this.kmReading,
    required this.speed,
    required this.status,
  });

  factory TrackingRecord.fromJson(Map<String, dynamic> json) {
    return TrackingRecord(
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      location: json['location'] ?? '',
      kmReading: json['km_reading'] ?? '',
      speed: json['speed'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
