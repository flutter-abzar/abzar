import 'package:intl/intl.dart';

extension StringExtensions on String {
  bool isNumeric() => double.tryParse(this) != null;

  int toInt() => int.parse(this);

  double toDouble() => double.parse(this);

  String separateNumbers3By3() => replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (final Match m) => '${m[1]},');

  String append0() => length == 1 ? "0$this" : this;

  int getDay() => int.parse(substring(8, 10).append0());

  int getMonth() => int.parse(substring(5, 7).append0());

  int getYear() => int.parse(substring(0, 4).append0());

  int getHour() => int.parse(substring(0, 2).append0());

  int getMinute() => int.parse(substring(3, 5).append0());

  String toTimeAgo({final bool numericDates = false, final bool persian = false}) {
    try {
      final Duration difference = DateTime.now().difference(DateFormat("yyyy-MM-ddThh:mm:sss").parse(this));
      if (difference.inDays > 8) {
        return this.substring(0, 10);
      } else if ((difference.inDays / 7).floor() >= 1) {
        return persian
            ? numericDates
                ? '۱ هفته پیش'
                : 'هفته پیش'
            : numericDates
                ? '1 week ago'
                : 'Last week';
      } else if (difference.inDays >= 2) {
        return persian ? '${difference.inDays.toString().toPersianNumber()} روز پیش' : '${difference.inDays} days ago';
      } else if (difference.inDays >= 1) {
        return persian
            ? numericDates
                ? '۱ روز پیش'
                : 'دیروز'
            : numericDates
                ? '1 day ago'
                : 'Yesterday';
      } else if (difference.inHours >= 2) {
        return persian ? '${difference.inHours.toString().toPersianNumber()} ساعت پیش' : '${difference.inHours} hours ago';
      } else if (difference.inHours >= 1) {
        return persian
            ? numericDates
                ? '۱ ساعت پیش'
                : 'یک ساعت پیش'
            : numericDates
                ? '1 hour ago'
                : 'An hour ago';
      } else if (difference.inMinutes >= 2) {
        return persian ? '${difference.inMinutes.toString().toPersianNumber()} دقیقه پیش' : '${difference.inMinutes} minutes ago';
      } else if (difference.inMinutes >= 1) {
        return persian
            ? numericDates
                ? '۱ دقیقه پیش'
                : 'یک دقیقه پیش'
            : numericDates
                ? '1 minute ago'
                : 'A minute ago';
      } else if (difference.inSeconds >= 3) {
        return persian ? '${difference.inSeconds.toString().toPersianNumber()} ثانیه پیش' : '${difference.inSeconds} seconds ago';
      } else {
        return persian ? 'همین الان' : 'Just now';
      }
    } catch (e) {
      return this;
    }
  }

  String toPersianNumber() {
    String number = this;
    number = number.replaceAll("1", "۱");
    number = number.replaceAll("2", "۲");
    number = number.replaceAll("3", "۳");
    number = number.replaceAll("4", "۴");
    number = number.replaceAll("5", "۵");
    number = number.replaceAll("6", "۶");
    number = number.replaceAll("7", "۷");
    number = number.replaceAll("8", "۸");
    number = number.replaceAll("9", "۹");
    number = number.replaceAll("0", "۰");
    return number;
  }

  String toEnglishNumber() {
    String number = this;
    number = number.replaceAll("۱", "1");
    number = number.replaceAll("۲", "2");
    number = number.replaceAll("۳", "3");
    number = number.replaceAll("۴", "4");
    number = number.replaceAll("۵", "5");
    number = number.replaceAll("۶", "6");
    number = number.replaceAll("۷", "7");
    number = number.replaceAll("۸", "8");
    number = number.replaceAll("۹", "9");
    number = number.replaceAll("۰", "0");
    return number;
  }

  String toPersianDay() {
    String day = this;
    day = day.replaceAll("Sunday", "یک شنبه");
    day = day.replaceAll("Monday", "دو شنبه");
    day = day.replaceAll("Tuesday", "سه شنبه");
    day = day.replaceAll("Wednesday", "چهار شنبه");
    day = day.replaceAll("Thursday", "پنج شنبه");
    day = day.replaceAll("Friday", "جمعه");
    day = day.replaceAll("Saturday", "شنبه");
    return day;
  }

  String toEnglishDay() {
    String day = this;
    day = day.replaceAll("یک شنبه", "Sunday");
    day = day.replaceAll("دو‌شنبه", "Monday");
    day = day.replaceAll("سه‌شنبه", "Tuesday");
    day = day.replaceAll("چهار‌شنبه", "Tuesday");
    day = day.replaceAll("پنج‌شنبه", "Thursday");
    day = day.replaceAll("جمعه", "Friday");
    day = day.replaceAll("جمعه", "Friday");
    day = day.replaceAll("شنبه", "Saturday");
    return day;
  }

  String toPersianMonth() {
    String month = this;
    month = month.replaceAll("01", "فروردین");
    month = month.replaceAll("02", "اردیبهشت");
    month = month.replaceAll("03", "خرداد");
    month = month.replaceAll("04", "تیر");
    month = month.replaceAll("05", "مرداد");
    month = month.replaceAll("06", "شهریور");
    month = month.replaceAll("07", "مهر");
    month = month.replaceAll("08", "آبان");
    month = month.replaceAll("09", "آذر");
    month = month.replaceAll("10", "دی");
    month = month.replaceAll("11", "بهمن");
    month = month.replaceAll("12", "اسفند");
    return month;
  }

  String toEnglishMonth() {
    String month = this;
    month = month.replaceAll("01", "January");
    month = month.replaceAll("02", "February");
    month = month.replaceAll("03", "March");
    month = month.replaceAll("04", "April");
    month = month.replaceAll("05", "May");
    month = month.replaceAll("06", "June");
    month = month.replaceAll("07", "July");
    month = month.replaceAll("08", "August");
    month = month.replaceAll("09", "September");
    month = month.replaceAll("10", "October");
    month = month.replaceAll("11", "November");
    month = month.replaceAll("12", "December");
    return month;
  }
}
