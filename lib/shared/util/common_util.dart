import 'package:intl/intl.dart';

class CommonUtil {
  CommonUtil._();

  static String getFormattedMonthDaySec(int sec, {int? timezoneOffset}) {
    return DateFormat('MMM d').format(getTimezoneAwareDtFromSec(sec, timezoneOffset: timezoneOffset));
  }

  static String getDayInWeekSec(int sec, {int? timezoneOffset}) {
    return DateFormat('EEE').format(getTimezoneAwareDtFromSec(sec, timezoneOffset: timezoneOffset));
  }

  static String getFormattedHourSec(int sec, {int? timezoneOffset}) {
    return DateFormat('HH:mm').format(getTimezoneAwareDtFromSec(sec, timezoneOffset: timezoneOffset));
  }

  static String getFormattedDayHourSec(int sec, {int? timezoneOffset}) {
    return DateFormat('MMM d | HH:mm').format(getTimezoneAwareDtFromSec(sec, timezoneOffset: timezoneOffset));
  }

  static String fareinheitToCelcius(double fareinheit) {
    return ((fareinheit - 32) * 5 / 9).toStringAsFixed(1);
  }

  static String kelvinToCelcius(double kelvin, {int? fractionDigits}) {
    return (kelvin - 273.15).toStringAsFixed(fractionDigits ?? 1);
  }

  static int getDaysFromSec(int sec, {int? timezoneOffset}) {
    return ((sec + (timezoneOffset ?? 0)) / (60 * 60 * 24)).floor();
  }

  static DateTime getTimezoneAwareDtFromSec(int sec, {int? timezoneOffset}) {
    if(timezoneOffset == null) return getDtFromSec(sec);
    return DateTime.fromMillisecondsSinceEpoch(sec * 1000, isUtc: true).add(Duration(seconds: timezoneOffset));
  }

  static DateTime getDtFromSec(int sec) {
    return DateTime.fromMillisecondsSinceEpoch(sec * 1000);
  }
}
