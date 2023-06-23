import 'dart:convert';
import 'dart:io';


extension FileExtension on File {
  String toBase64() => base64Encode(readAsBytesSync());
}
