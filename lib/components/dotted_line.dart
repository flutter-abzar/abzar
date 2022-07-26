import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({
    final Key? key,
    this.dashHeight = 1,
    this.color = Colors.grey,
    this.dashWidth = 5,
    this.dashRadius = 0,
    this.space = 2.5,
  }) : super(key: key);
  final double dashHeight;
  final Color color;
  final double dashWidth;
  final double dashRadius;
  final double space;

  @override
  Widget build(final BuildContext context) => LayoutBuilder(
        builder: (final BuildContext context, final BoxConstraints constraints) {
          final double boxWidth = constraints.constrainWidth();
          final int dashCount = (boxWidth / (dashWidth + space)).floor();
          return Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(
              dashCount,
              (final _) => ClipRRect(
                borderRadius: BorderRadius.circular(dashRadius),
                child: SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: DecoratedBox(decoration: BoxDecoration(color: color)),
                ),
              ),
            ),
          );
        },
      );
}
