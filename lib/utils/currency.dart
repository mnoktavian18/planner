import 'package:intl/intl.dart';

class Currency {
  static String format(double number) {
    return NumberFormat.currency(locale: 'ID', symbol: 'Rp', decimalDigits: 0)
        .format(number);
  }
}
