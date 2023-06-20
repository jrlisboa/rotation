import 'dart:math';

import 'package:flutter/material.dart';

enum RotatorFlipState { showFirst, showSecond }

enum RotatorFlipDirection { horizontal, vertical }

class RotatorFlip extends StatefulWidget {
  const RotatorFlip({
    super.key,
    required this.firstChild,
    required this.secondChild,
    required this.duration,
    this.flipState = RotatorFlipState.showFirst,
    this.direction = RotatorFlipDirection.horizontal,
    this.firstCurve = Curves.linear,
    this.secondCurve = Curves.linear,
  });

  /// The child that is visible when [flipState] is
  /// [RotatorFlipState.showFirst]. It flips
  /// to [secondChild] when [flipState] is
  /// [RotatorFlipState.showSecond] and vice versa.
  final Widget firstChild;

  /// The child that is visible when [flipState] is
  /// [RotatorFlipState.showSecond]. It flips
  /// to [firstChild] when [flipState] is
  /// [RotatorFlipState.showFirst] and vice versa.
  final Widget secondChild;

  /// The duration of the flip animation.
  final Duration duration;

  /// The current state of the flipper.
  ///
  /// Defaults to [RotatorFlipState.showFirst].
  final RotatorFlipState flipState;

  /// The direction of the flip animation.
  ///
  /// Defaults to [RotatorFlipDirection.horizontal].
  final RotatorFlipDirection direction;

  /// The fade curve of the first child.
  ///
  /// Defaults to [Curves.linear].
  final Curve firstCurve;

  /// The fade curve of the second child.
  ///
  /// Defaults to [Curves.linear].
  final Curve secondCurve;

  @override
  State<RotatorFlip> createState() => _RotatorFlipState();
}

class _RotatorFlipState extends State<RotatorFlip> {
  /// This matrix is used to rotate a widget
  /// around the z-axis to create a flip animation.
  /// | 1, 0, 0, 0,          |
  /// | 0, 1, 0, 0,          |
  /// | 0, 0, 1, pv * 0.001, |
  /// | 0, 0, 0, 1,          |
  static Matrix4 _pmat(final num pv) =>
      Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, pv * 0.001, 0, 0, 0, 1);

  final Matrix4 _perspective = _pmat(4.0);

  Animation<double> _rotateAnimation(final Animation<double> animation) =>
      Tween<double>(begin: pi, end: 0).animate(animation);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.duration,
      switchInCurve: widget.firstCurve,
      switchOutCurve: widget.secondCurve,
      transitionBuilder: _buildAnimation,
      child: widget.flipState == RotatorFlipState.showFirst
          ? Container(key: const ValueKey(true), child: widget.firstChild)
          : Container(key: const ValueKey(false), child: widget.secondChild),
    );
  }

  Widget _buildAnimation(
    final Widget child,
    final Animation<double> animation,
  ) {
    final Animation<double> rotate = _rotateAnimation(animation);
    return AnimatedBuilder(
        animation: rotate,
        child: child,
        builder: (final BuildContext context, final Widget? child) {
          final bool isFirstChild = child?.key == const ValueKey<bool>(true);
          final bool isHorizontal =
              widget.direction == RotatorFlipDirection.horizontal;

          final double angle = isFirstChild
              ? min(rotate.value, pi / 2)
              : -min(rotate.value, pi / 2);

          return Transform(
            transform: _perspective.scaled(1.0, 1.0, 1.0)
              ..rotateX(isHorizontal ? 0 : angle)
              ..rotateY(isHorizontal ? angle : 0)
              ..rotateZ(0),
            alignment: Alignment.center,
            child: child,
          );
        });
  }
}
