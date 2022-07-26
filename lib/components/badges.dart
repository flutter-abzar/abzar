import 'package:flutter/material.dart';

/// This is a set of animations that you can use for your [Badge] widget.
enum BadgeAnimationType {
  /// This value is for using the slide animation
  ///
  /// See also:
  /// * [SlideTransition]
  slide,

  /// This value is for using the scale animation
  ///
  /// See also:
  /// * [ScaleTransition]
  scale,

  /// This value is for using the fade animation
  ///
  /// See also:
  /// * [FadeTransition]
  fade,
}

/// This widget allows you to add badges to any of your [Widget].
class Badge extends StatefulWidget {
  /// Creates a [Badge].
  ///
  /// If [child] is null, it doesn't make sense to set [ignorePointer],
  /// [position] and [alignment]
  ///
  /// See also:
  ///
  /// * [BadgeShape]
  /// * [BorderRadius]
  /// * [BadgeAnimationType]
  /// * [BorderSide]
  Badge({
    Key? key,
    this.badgeContent,
    this.child,
    this.badgeColor = Colors.red,
    this.elevation = 2,
    this.toAnimate = true,
    this.position,
    this.shape = BadgeShape.circle,
    this.padding = const EdgeInsets.all(5.0),
    this.animationDuration = const Duration(milliseconds: 500),
    this.borderRadius = BorderRadius.zero,
    this.alignment = Alignment.center,
    this.animationType = BadgeAnimationType.slide,
    this.showBadge = true,
    this.ignorePointer = false,
    this.borderSide = BorderSide.none,
    this.stackFit = StackFit.loose,
    this.gradient,
  }) : super(key: key);

  /// It defines the widget that will be wrapped by this [badgeContent].
  final Widget? child;

  /// This defines alignment for your [child].
  ///
  /// The default value is [Alignment.center].
  final AlignmentGeometry alignment;

  /// Allows to set custom position of [badgeContent].
  /// according to [child].
  ///
  /// If [child] is null, it doesn't make sense to use it.
  final BadgePosition? position;

  /// Content of this badge widget
  final Widget? badgeContent;

  /// Can make your [badgeContent] interactive.
  ///
  /// The default value is false.
  final bool ignorePointer;

  /// Allows you to set the color for this [badgeContent].
  final Color badgeColor;

  /// Allows you to set the gradient color for this [badgeContent]
  final Gradient? gradient;

  /// This controls the size of the shadow below the material and the opacity.
  /// of the elevation overlay color if it is applied.
  final double elevation;

  /// This controls animation status.
  ///
  /// The default value is true.
  /// If true, the animation is allowed, if false, the animation is forbidden.
  ///
  /// See also:
  ///
  /// * [animationDuration]
  /// * [animationType]
  final bool toAnimate;

  /// This controls the duration of the animation.
  ///
  /// The default value is Duration(milliseconds: 500).
  ///
  /// See also:
  ///
  /// * [toAnimate]
  /// * [animationType]
  final Duration animationDuration;

  /// This controls the type of the animation.
  ///
  /// The default value is [BadgeAnimationType.slide].
  ///
  /// See also:
  ///
  /// * [toAnimate]
  /// * [animationDuration]
  final BadgeAnimationType animationType;

  /// Allows to set the shape to this [badgeContent].
  ///
  /// The default value is [BadgeShape.circle].
  final BadgeShape shape;

  /// Allows to set border side to this [badgeContent].
  ///
  /// The default value is [BorderSide.none].
  final BorderSide borderSide;

  /// Allows to edit fit parameter to [Stack] widget.
  ///
  /// The default value is [StackFit.loose].
  final StackFit stackFit;

  /// Allows to set border radius to this [badgeContent].
  ///
  /// The default value is [BorderRadius.zero].
  ///
  /// See also:
  ///
  /// * [borderSide]
  final BorderRadiusGeometry borderRadius;

  /// Specify padding for [badgeContent].
  ///
  /// The default value is EdgeInsets.all(5.0).
  final EdgeInsetsGeometry padding;

  /// Allows you to hide or show [badgeContent].
  ///
  /// The default value is true.
  /// If true, the badge will be displayed, if false, it doesn't.
  final bool showBadge;

  @override
  BadgeState createState() => BadgeState();
}

class BadgeState extends State<Badge> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final Tween<Offset> _positionTween = Tween(begin: const Offset(-0.5, 0.9), end: const Offset(0.0, 0.0));
  final Tween<double> _scaleTween = Tween<double>(begin: 0.1, end: 1);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    if (widget.animationType == BadgeAnimationType.slide) {
      _animation = CurvedAnimation(parent: _animationController, curve: Curves.elasticOut);
    } else if (widget.animationType == BadgeAnimationType.scale) {
      _animation = _scaleTween.animate(_animationController);
    } else if (widget.animationType == BadgeAnimationType.fade) {
      _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    }

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child == null) {
      return _getBadge();
    } else {
      return Stack(
        fit: widget.stackFit,
        alignment: widget.alignment,
        clipBehavior: Clip.none,
        children: [
          widget.child!,
          BadgePositioned(
            position: widget.position,
            child: widget.ignorePointer ? IgnorePointer(child: _getBadge()) : _getBadge(),
          ),
        ],
      );
    }
  }

  Widget _getBadge() {
    final border = widget.shape == BadgeShape.circle
        ? CircleBorder(side: widget.borderSide)
        : RoundedRectangleBorder(
            side: widget.borderSide,
            borderRadius: widget.borderRadius,
          );

    Widget _badgeView() => AnimatedOpacity(
          opacity: widget.showBadge ? 1 : 0,
          duration: Duration(milliseconds: 200),
          child: Material(
            shape: border,
            elevation: widget.elevation,
            color: widget.badgeColor,
            child: Padding(padding: widget.padding, child: widget.badgeContent),
          ),
        );

    Widget _badgeViewGradient() => AnimatedOpacity(
          opacity: widget.showBadge ? 1 : 0,
          duration: Duration(milliseconds: 200),
          child: Material(
            shape: border,
            elevation: widget.elevation,
            child: Container(
              decoration: widget.shape == BadgeShape.circle
                  ? BoxDecoration(gradient: widget.gradient, shape: BoxShape.circle)
                  : BoxDecoration(
                      gradient: widget.gradient,
                      shape: BoxShape.rectangle,
                      borderRadius: widget.borderRadius,
                    ),
              child: Padding(padding: widget.padding, child: widget.badgeContent),
            ),
          ),
        );

    if (widget.toAnimate) {
      if (widget.animationType == BadgeAnimationType.slide) {
        return SlideTransition(
          position: _positionTween.animate(_animation),
          child: widget.gradient == null ? _badgeView() : _badgeViewGradient(),
        );
      } else if (widget.animationType == BadgeAnimationType.scale) {
        return ScaleTransition(
          scale: _animation,
          child: widget.gradient == null ? _badgeView() : _badgeViewGradient(),
        );
      } else if (widget.animationType == BadgeAnimationType.fade) {
        return FadeTransition(
          opacity: _animation,
          child: widget.gradient == null ? _badgeView() : _badgeViewGradient(),
        );
      }
    }

    return widget.gradient == null ? _badgeView() : _badgeViewGradient();
  }

  @override
  void didUpdateWidget(Badge oldWidget) {
    if (widget.badgeContent is Text && oldWidget.badgeContent is Text) {
      final newText = widget.badgeContent as Text;
      final oldText = oldWidget.badgeContent as Text;
      if (newText.data != oldText.data) {
        _animationController.reset();
        _animationController.forward();
      }
    }

    if (widget.badgeContent is Icon && oldWidget.badgeContent is Icon) {
      final newIcon = widget.badgeContent as Icon;
      final oldIcon = oldWidget.badgeContent as Icon;
      if (newIcon.icon != oldIcon.icon) {
        _animationController.reset();
        _animationController.forward();
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

/// Utility class. Don't try to use it!
///
/// This contain a custom position for the [Badge]
class BadgePosition {
  /// This is the distance to the top side of a parent widget.
  final double? top;

  /// This is the distance to the end side of a parent widget.
  final double? end;

  /// This is the distance to the start side of a parent widget.
  final double? start;

  /// This is the distance to the bottom side of a parent widget.
  final double? bottom;

  /// This is indicate that centralise is required
  final bool isCenter;

  /// This creates a new instance of this widget
  const BadgePosition({this.top, this.end, this.bottom, this.start, this.isCenter = false});

  /// Factory method that creates a new instance of this widget
  /// according to the center
  factory BadgePosition.center() => BadgePosition(isCenter: true);

  /// Factory method that creates a new instance of this widget
  /// according to [top] and [start]
  factory BadgePosition.topStart({double top = -5, double start = -10}) => BadgePosition(top: top, start: start);

  /// Factory method that creates a new instance of this widget
  /// according to [top] and [end]
  factory BadgePosition.topEnd({double top = -8, double end = -10}) => BadgePosition(top: top, end: end);

  /// Factory method that creates a new instance of this widget
  /// according to [bottom] and [end]
  factory BadgePosition.bottomEnd({double bottom = -8, double end = -10}) => BadgePosition(bottom: bottom, end: end);

  /// Factory method that creates a new instance of this widget
  /// according to [bottom] and [start]
  factory BadgePosition.bottomStart({double bottom = -8, double start = -10}) => BadgePosition(bottom: bottom, start: start);
}

/// This is a set of shapes that you can use for your [Badge] widget.
enum BadgeShape {
  /// This value is for using a circular badges
  ///
  /// See also:
  /// * [CircleBorder]
  circle,

  /// This value is for using a square badges
  ///
  /// See also:
  /// * [RoundedRectangleBorder]
  square,
}

/// Utility class. Don't try to use it!
///
/// This is just a comfortable wrap for [PositionedDirectional],
/// [BadgePosition] and [child].
class BadgePositioned extends StatelessWidget {
  /// This specify a badge position according to [child]
  final BadgePosition? position;

  /// It is a child that will be displayed according to [position]
  final Widget child;

  /// This creates a new instance of [BadgePositioned].
  ///
  /// See also:
  /// * [PositionedDirectional]
  const BadgePositioned({Key? key, this.position, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final position = this.position;
    if (position == null) {
      final topRight = BadgePosition.topEnd();
      return PositionedDirectional(top: topRight.top, end: topRight.end, child: child);
    }

    if (position.isCenter) {
      return Positioned.fill(
        child: Align(alignment: Alignment.center, child: child),
      );
    }

    return PositionedDirectional(
      top: position.top,
      end: position.end,
      bottom: position.bottom,
      start: position.start,
      child: child,
    );
  }
}
