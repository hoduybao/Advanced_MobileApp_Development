import 'package:advanced_mobileapp_development/model/schedule-dto.dart';
import 'package:flutter/cupertino.dart';


class MyScheduleChangeNotifier extends ChangeNotifier {
  List<ScheduleDTO> mySchedule = [];

  // Add any methods or properties you need for managing mySchedule.

  // Example method:
  void addSchedule(ScheduleDTO schedule) {
    mySchedule.add(schedule);
    notifyListeners();
  }


}