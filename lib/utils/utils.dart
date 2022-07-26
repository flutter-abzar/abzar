import 'dart:ui';

export 'extensions/align_extension.dart';
export 'extensions/date_extension.dart';
export 'extensions/file_extension.dart';
export 'extensions/iterable_extension.dart';
export 'extensions/number_extension.dart';
export 'extensions/string_extension.dart';
export 'extensions/text_extension.dart';
export 'extensions/widget_extension.dart';
export 'get.dart';
export 'launch.dart';
export 'share.dart';

void delay(final int milliseconds, final VoidCallback action) async => Future<dynamic>.delayed(
      Duration(milliseconds: milliseconds),
      () async => action(),
    );
