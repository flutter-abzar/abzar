import 'dart:ui' as ui;
import 'package:abzar/abzar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget divider({double? width, double height = 0.6, Color color = Colors.grey, EdgeInsets? padding}) => Container(
      margin: padding,
      width: width ?? screenWidth,
      height: height,
      color: color,
    );

Widget dashedDivider({double? height}) => Row(
      children: [
        for (int i = 0; i < 40; i++)
          Expanded(
            child: Row(
              children: [
                Expanded(child: Divider(thickness: 1, height: height)),
                Expanded(child: Container()),
              ],
            ),
          ),
      ],
    );

Widget centerProgress() => const Center(child: CircularProgressIndicator());

Widget centerProgressCupertino() => const Center(child: CupertinoActivityIndicator());

Widget directionality({required final bool rtl, required final Widget child}) => Directionality(
      textDirection: rtl ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: child,
    );
