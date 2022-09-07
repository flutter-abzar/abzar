import 'package:abzar/abzar.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

Widget otpTextField({
  final int length = 4,
  final bool autoFocus = false,
  final TextEditingController? controller,
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween,
  final String? hintCharacter,
  final void Function(String)? onCompleted,
  final double borderRadius = 8,
  final PinCodeFieldShape shape = PinCodeFieldShape.box,
  final EdgeInsetsGeometry? fieldOuterPadding,
  final double fieldHeight = 64,
  final double fieldWidth = 60,
  final double borderWidth = 1,
  final Color? fillColor,
  final Color? borderColor,
}) =>
    PinCodeTextField(
      controller: controller,
      appContext: context,
      length: length,
      autoFocus: autoFocus,
      mainAxisAlignment: mainAxisAlignment,
      hintCharacter: hintCharacter,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: shape,
        fieldOuterPadding: fieldOuterPadding,
        borderRadius: BorderRadius.circular(borderRadius),
        fieldHeight: fieldHeight,
        fieldWidth: fieldWidth,
        borderWidth: borderWidth ,
        activeFillColor: fillColor,
        inactiveFillColor: fillColor,
        selectedFillColor: fillColor,
        inactiveColor: borderColor,
        selectedColor: borderColor,
        activeColor: borderColor,
      ),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      onCompleted: onCompleted,
      onChanged: (final _) {},
    ).ltr();
