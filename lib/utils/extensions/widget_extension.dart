import 'dart:ui' as ui;
import 'package:flutter/material.dart';

extension WidgetsExtension on Widget {
  Widget withTooltip(
    final String message, {
    final Decoration? decoration,
    final double? height,
    final bool? preferBelow,
    final EdgeInsetsGeometry? padding,
    final TextStyle? textStyle,
    final Duration? waitDuration,
    final EdgeInsetsGeometry? margin,
  }) =>
      Tooltip(
        message: message,
        decoration: decoration,
        height: height,
        padding: padding,
        preferBelow: preferBelow,
        textStyle: textStyle,
        waitDuration: waitDuration,
        margin: margin,
        child: this,
      );

  Widget fit([final BoxFit fit = BoxFit.scaleDown]) => FittedBox(fit: fit, child: this);
  Widget expanded([final int? flex]) => Expanded(flex: flex ?? 1, child: this);
  Widget onTap(final GestureTapCallback? onPressed) => GestureDetector(onTap: onPressed, child: this);
  Widget ltr() => Directionality(textDirection: ui.TextDirection.ltr, child: this);
  Widget rtl() => Directionality(textDirection: ui.TextDirection.rtl, child: this);
}
