import 'package:intl/intl.dart';

class AppFormat {
  static String date(String stringDate) {
    // 2023-02-05
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MM yyyy', 'en_US').format(dateTime); // 5 Feb 2023
  }

  static String dateMonth(String stringDate) {
    // 2023-02-05
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MM', 'en_US').format(dateTime); // 5 Feb
  }

  static String currency(double number) {
    return NumberFormat.currency(
      decimalDigits: 0,
      locale: 'en_US',
      symbol: '\$',
    ).format(number);
  }
}
