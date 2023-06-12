import 'package:flutter/material.dart';

enum FollowerDistorion { none, light, heavy }

enum FollowBehavior { reverse, normal }

class RotatorFollower extends StatefulWidget {
  const RotatorFollower({
    required this.child,
    this.distorion = FollowerDistorion.none,
    this.behavior = FollowBehavior.normal,
    super.key,
  });

  /// The widget to be rotated.
  final Widget child;

  /// The amount of distortion to apply to the rotation.
  /// [none] will emulate the 3D rotation appearance.
  /// [light] and [heavy] will create distortions in the edges of the widget.
  final FollowerDistorion distorion;

  /// The behavior of the rotation.
  /// [normal] will rotate the widget in the direction of the mouse.
  /// [reverse] will rotate the widget in the opposite direction.
  /// Defaults to [normal].
  final FollowBehavior behavior;

  @override
  State<RotatorFollower> createState() => _RotatorFollowerState();
}

class _RotatorFollowerState extends State<RotatorFollower> {
  double _mouseX = 0;
  double _mouseY = 0;
  double _screenWidth = 0;
  double _screenHeight = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _screenWidth = MediaQuery.of(context).size.width;
        _screenHeight = MediaQuery.of(context).size.height;
      });
    });
    super.initState();
  }

  void _updateMousePosition(final PointerEvent details) {
    setState(() {
      _mouseX = details.position.dx - (_screenWidth / 2);
      _mouseY = details.position.dy - (_screenHeight / 2);
    });
  }

  double _getDistortion() {
    switch (widget.distorion) {
      case FollowerDistorion.none:
        return 0.005;
      case FollowerDistorion.light:
        return 0.05;
      case FollowerDistorion.heavy:
        return 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildMouseRegionWrapper(
      _buildTransformWrapper(widget.child),
    );
  }

  Widget _buildMouseRegionWrapper(final Widget child) {
    return MouseRegion(
      onEnter: _updateMousePosition,
      onExit: _updateMousePosition,
      onHover: _updateMousePosition,
      child: child,
    );
  }

  Widget _buildTransformWrapper(final Widget child) {
    final double height = widget.behavior == FollowBehavior.reverse
        ? -_screenHeight
        : _screenHeight;
    final double width = widget.behavior == FollowBehavior.reverse
        ? _screenWidth
        : -_screenWidth;

    Matrix4 transform = Matrix4.identity()
      ..setEntry(3, 2, _getDistortion())
      ..rotateX(1 * ((_mouseY) / height))
      ..rotateY(1 * ((_mouseX) / width));

    return Transform(
      transform: transform,
      alignment: FractionalOffset.center,
      child: child,
    );
  }
}
