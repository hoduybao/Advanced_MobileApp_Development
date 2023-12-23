import 'package:json_annotation/json_annotation.dart';

import 'booking_infor.dart';
import 'schedule.dart';


@JsonSerializable()
class ScheduleDetail {
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  String? createdAt;
  String? updatedAt;
  List<BookingInfo>? bookingInfo;
  bool? isBooked;
  Schedule? scheduleInfo;
  ScheduleDetail({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.bookingInfo,
    this.isBooked,
    this.scheduleInfo,
  });
  factory ScheduleDetail.fromJson(Map<String, dynamic> json) =>
      ScheduleDetail(
        startPeriodTimestamp: json['startPeriodTimestamp'] as int?,
        endPeriodTimestamp: json['endPeriodTimestamp'] as int?,
        id: json['id'] as String?,
        scheduleId: json['scheduleId'] as String?,
        startPeriod: json['startPeriod'] as String?,
        endPeriod: json['endPeriod'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        bookingInfo: (json['bookingInfo'] as List<dynamic>?)
            ?.map((e) => BookingInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        isBooked: json['isBooked'] as bool?,
        scheduleInfo: json['scheduleInfo'] == null
            ? null
            : Schedule.fromJson(json['scheduleInfo'] as Map<String, dynamic>),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{
    'startPeriodTimestamp': startPeriodTimestamp,
    'endPeriodTimestamp': endPeriodTimestamp,
    'id': id,
    'scheduleId': scheduleId,
    'startPeriod': startPeriod,
    'endPeriod': endPeriod,
    'createdAt':createdAt,
    'updatedAt': updatedAt,
    'bookingInfo': bookingInfo,
    'isBooked': isBooked,
    'scheduleInfo': scheduleInfo,
  };
}
