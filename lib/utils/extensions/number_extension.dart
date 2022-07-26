extension IntExtesion on int {
  String toKMB() {
    if (this > 999 && this < 99999)
      return "${(this / 1000).toStringAsFixed(1)} K";
    else if (this > 99999 && this < 999999)
      return "${(this / 1000).toStringAsFixed(0)} K";
    else if (this > 999999 && this < 999999999)
      return "${(this / 1000000).toStringAsFixed(1)} M";
    else if (this > 999999999)
      return "${(this / 1000000000).toStringAsFixed(1)} B";
    else
      return toString();
  }

  String secondsToTimeLeft() {
    final int h = this ~/ 3600;
    final int m = (this - h * 3600) ~/ 60;
    final int s = this - (h * 3600) - (m * 60);

    final String hourLeft = h.toString().length < 2 ? "0$h" : h.toString();
    final String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();
    final String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

    String result = "";

    if (minuteLeft == "00") {
      result = secondsLeft;
    } else if (hourLeft == "00") {
      result = "$minuteLeft:$secondsLeft";
    } else {
      result = "$hourLeft:$minuteLeft:$secondsLeft";
    }
    return result;
  }
}
