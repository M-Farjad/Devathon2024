import 'package:intl/intl.dart';

class DateTimeUtil {
  DateTimeUtil._();
  static String getFormattedTimeDate(String dateTime) {
    final checkOutTime = DateTime.parse(dateTime);
    final dateFormat = DateFormat('dd/MM/yy');
    final timeFormat = DateFormat('hh:mm a');
    final formattedDate = dateFormat.format(checkOutTime);
    final formattedTime = timeFormat.format(checkOutTime);
    return '$formattedTime | $formattedDate';
  }

  static String getFormattedDateTime(String dateTime) {
    final checkOutTime = DateTime.parse(dateTime);
    final dateFormat = DateFormat('MMM dd,yyyy');
    final timeFormat = DateFormat('hh:mm a');
    final formattedDate = dateFormat.format(checkOutTime);
    final formattedTime = timeFormat.format(checkOutTime);
    return '$formattedDate | $formattedTime';
  }

  static String getYYYYMMDD(String dateTime) =>
      DateFormat('yyyy-MM-dd').format(DateTime.parse(dateTime));

  static String getDifferenceInTime(String checkIn, String checkOut) {
    final checkInTime = DateTime.parse(checkIn);
    final checkOutTime = DateTime.parse(checkOut);
    final difference = checkOutTime.difference(checkInTime);
    final hours = difference.inHours;
    final minutes = difference.inMinutes.remainder(60);
    return '${hours}hr ${minutes}min';
  }

  static String getHistoryDate(String dateTime) {
    final checkInTime = DateTime.parse(dateTime);
    final dateFormat = DateFormat('dd\nEEE');
    final formattedDate = dateFormat.format(checkInTime);
    return formattedDate;
  }

  static String getCurrentMonthMMM() {
    final now = DateTime.now();
    return DateFormat('MMM').format(now);
  }

  static String getDatedd(String date) {
    return DateFormat('dd').format(DateTime.parse(date));
  }

  static String getDateEEE(String date) {
    return DateFormat('EEE').format(DateTime.parse(date));
  }

  static String getDateBasedOnIncomingTime(String dateTime) {
    final incomingTime = DateTime.parse(dateTime);
    final now = DateTime.now();
    if (incomingTime.year == now.year &&
        incomingTime.month == now.month &&
        incomingTime.day == now.day) {
      final timeFormat = DateFormat('hh:mm a');
      final formattedTime = timeFormat.format(incomingTime);
      return formattedTime;
    } else if (incomingTime.year == now.year &&
            incomingTime.month == now.month &&
            incomingTime.day == now.day - 1 ||
        (incomingTime.month == now.month - 1 &&
            (now.day == 1 &&
                (incomingTime.day == 31 ||
                    incomingTime.day == 30 ||
                    incomingTime.day == 28 ||
                    incomingTime.day == 29)))) {
      final timeFormat = DateFormat('hh:mm a');
      final formattedTime = timeFormat.format(incomingTime);
      return formattedTime;
    } else {
      final dateFormat = DateFormat('dd-MM-yy');
      final formattedDate = dateFormat.format(incomingTime);
      return formattedDate;
    }
  }
}
