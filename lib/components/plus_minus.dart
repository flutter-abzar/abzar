import 'package:flutter/material.dart';
import 'package:get/get.dart';


Widget plusMinus({
  required final Function(int) onChanged,
  final int range = 1,
  final int defaultValue = 0,
  final Widget? addWidget,
  final Widget? minusWidget,
  final double spaceBetween = 10,
  final TextStyle? textStyle,
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  final MainAxisSize mainAxisSize = MainAxisSize.min,
}) {
  final RxInt currentAmount = defaultValue.obs;

  final RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  String mathFunc(final Match match) => '${match[1]},';

  void increaseAmount() {
    currentAmount.value = currentAmount.value + range;
    onChanged(currentAmount.value);
  }

  void decreaseAmount() {
    if (currentAmount > range - 1) currentAmount.value = currentAmount.value - range;
    onChanged(currentAmount.value);
  }

  String amountString() {
    final String result = currentAmount
        .toString()
        .padLeft(
          currentAmount.value.toString().length,
          '0',
        )
        .replaceAllMapped(reg, mathFunc);
    return result;
  }

  return Obx(
    () => Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: <Widget>[
        GestureDetector(onTap: increaseAmount, child: addWidget ?? const Icon(Icons.add_circle, size: 30)),
        Text(amountString(), style: textStyle).marginSymmetric(horizontal: spaceBetween),
        GestureDetector(onTap: decreaseAmount, child: minusWidget ?? const Icon(Icons.remove_circle, size: 30)),
      ],
    ),
  );
}
