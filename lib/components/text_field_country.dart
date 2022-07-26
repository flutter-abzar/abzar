import 'package:abzar/abzar.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

Widget textFieldCountry({
  final TextEditingController? controller,
  final String initialIsoCode = "IR",
  final void Function(String)? onChanged,
  final String hintText = "Phone number",
  final PhoneInputSelectorType selectorType = PhoneInputSelectorType.DIALOG,
  final Color? fillColor,
  final Color borderColor = Colors.grey,
  final double borderRadius = 12,
  final int maxLength = 10,
}) =>
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor),
        color: fillColor,
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: (final PhoneNumber number) {
          if (onChanged != null) onChanged(number.phoneNumber ?? "");
        },
        selectorConfig: SelectorConfig(selectorType: selectorType),
        spaceBetweenSelectorAndTextField: 0,
        initialValue: PhoneNumber(isoCode: initialIsoCode),
        hintText: hintText,
        textFieldController: controller,
        formatInput: false,
        keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
        inputBorder: InputBorder.none,
        maxLength: maxLength,
      ).ltr(),
    );
