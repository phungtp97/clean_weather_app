import 'package:intl/intl.dart';

class CommonUtil {
  CommonUtil._();

  static String getFormattedDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String getFormattedMonthDay(DateTime date) {
    return DateFormat('MMM d').format(date);
  }

  static String getDayInWeekSec(int sec) {
    return DateFormat('EEE').format(DateTime.fromMillisecondsSinceEpoch(sec * 1000));
  }

  static String getFormattedHour(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }

  static String fareinheitToCelcius(double fareinheit) {
    print('fareinheit: $fareinheit');
    return ((fareinheit - 32) * 5 / 9).toStringAsFixed(1);
  }

  static String kelvinToCelcius(double kelvin, {int? fractionDigits}) {
    return (kelvin - 273.15).toStringAsFixed(fractionDigits ?? 1);
  }

  static int getDaysFromSeconds(int sec) {
    return (sec / (60 * 60 * 24)).floor();
  }
}
