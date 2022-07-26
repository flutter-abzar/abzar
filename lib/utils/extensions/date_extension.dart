import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String formatDate(final String dateFormat) => DateFormat(dateFormat).format(this);
}
