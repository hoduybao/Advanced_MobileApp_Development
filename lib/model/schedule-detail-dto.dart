class ScheduleDetails {
  final int startPeriodTimestamp;
  final int endPeriodTimestamp;
  final String id;
  final String scheduleId;
  final String startPeriod;
  final String endPeriod;
  final String createdAt;
  final String updatedAt;
  final List<dynamic> bookingInfo; // Bạn cần thay đổi kiểu dữ liệu tùy thuộc vào dữ liệu thực tế
  final bool isBooked;

  ScheduleDetails({
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.id,
    required this.scheduleId,
    required this.startPeriod,
    required this.endPeriod,
    required this.createdAt,
    required this.updatedAt,
    required this.bookingInfo,
    required this.isBooked,
  });

  factory ScheduleDetails.fromJson(Map<String, dynamic> json) {
    return ScheduleDetails(
      startPeriodTimestamp: json['startPeriodTimestamp'] as int,
      endPeriodTimestamp: json['endPeriodTimestamp'] as int,
      id: json['id'] as String,
      scheduleId: json['scheduleId'] as String,
      startPeriod: json['startPeriod'] as String,
      endPeriod: json['endPeriod'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      bookingInfo: json['bookingInfo'] as List<dynamic>,
      isBooked: json['isBooked'] as bool,
    );
  }
}
