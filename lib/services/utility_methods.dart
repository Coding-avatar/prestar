import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UtilityMethodsManager {
  String beautifyTime(String time) {
    DateFormat dateFormat = new DateFormat('HH:mm:ss');
    DateTime dateTime = dateFormat.parse(time);

    TimeOfDay timeOfDay = new TimeOfDay.fromDateTime(dateTime);
    TimeOfDay selectedTime = timeOfDay.replacing(hour: timeOfDay.hourOfPeriod);

    // very crude implementation
    String hour = "";
    String mins = "";

    if (timeOfDay.hour < 12) {
      if (timeOfDay.hour < 10) {
        if (timeOfDay.hour == 0)
          hour = '12';
        else
          hour = '0${timeOfDay.hour}';
      } else
        hour = timeOfDay.hour.toString();

      if (timeOfDay.minute < 10)
        mins = '0${timeOfDay.minute}';
      else
        mins = timeOfDay.minute.toString();

      return "$hour:$mins am";
    } else {
      if (selectedTime.hour < 10) {
        if (selectedTime.hour == 0)
          hour = '12';
        else
          hour = '0${selectedTime.hour}';
      } else
        hour = selectedTime.hour.toString();

      if (selectedTime.minute < 10)
        mins = '0${selectedTime.minute}';
      else
        mins = selectedTime.minute.toString();

      return "$hour:$mins pm";
    }
  }

  bool timeRemainingLessThanFifteenMinutes(String time) {
    DateTime dateTimeNow = DateTime.now();
    DateFormat dateFormat = new DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime inputTime = dateFormat.parse(
        '${dateTimeNow.year}-${dateTimeNow.month}-${dateTimeNow.day} $time');

    int difference = dateTimeNow.difference(inputTime).inHours;
    // print('Input Time');
    // print(inputTime);
    // print('Remaining Time');
    // print(difference);
    if (difference <= 1)
      return true;
    else
      return false;
  }

  int remainingTime(String time) {
    DateTime dateTimeNow = DateTime.now();
    DateFormat dateFormat = new DateFormat('yyyy-MM-dd HH:mm:ss');

    DateTime inputTime = dateFormat.parse(
        '${dateTimeNow.year}-${dateTimeNow.month}-${dateTimeNow.day} $time');

    int difference = inputTime.difference(dateTimeNow).inMinutes;
    print('Input Time');
    print(inputTime);
    print('Remaining Time');
    print(difference);
    return difference;
  }

  bool findDifference(String time) {
    DateTime dateTimeNow = DateTime.now();
    DateFormat dateFormat = new DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime inputTime = dateFormat.parse(
        '${dateTimeNow.year}-${dateTimeNow.month}-${dateTimeNow.day} $time');

    int difference = dateTimeNow.difference(inputTime).inMinutes;

    if (difference <= 0)
      return true;
    else
      return false;
  }

  bool findUpdateStatus(String date, String time) {
    DateTime dateTimeNow = DateTime.now();
    DateFormat dateFormat = new DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime inputTime = dateFormat.parse(
        '${date.substring(6, 10)}-${date.substring(3, 5)}-${date.substring(0, 2)} $time');
    int difference = inputTime.difference(dateTimeNow).inMinutes;
    if (difference <= 0)
      return true;
    else
      return false;
  }

  bool isValuePresentInNum(int valToCheck, int number) {
    int tempNum = number;
    int sum = 0;
    while (tempNum != 0) {
      sum += tempNum % 10;
      tempNum = tempNum ~/ 10;
    }
    if (sum % 10 == valToCheck) {
      return true;
    } else
      return false;
  }

  bool checkIfValidEmail(String email) {
    if (RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return true;
    }

    return false;
  }

  bool checkIfValidMobile(String mobile) {
    if (mobile.length == 10)
      return true;
    else
      return false;
  }

  String getDateFromString(String date, String format) {
    DateFormat dateFormat = new DateFormat(format);
    DateTime dateTime = dateFormat.parse(date);
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }
}
