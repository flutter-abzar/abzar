import 'dart:io';

import 'package:abzar/abzar.dart';

extension FileExtension on File {
  String toBase64() => base64Encode(readAsBytesSync());
}
