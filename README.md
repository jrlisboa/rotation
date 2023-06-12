<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Rotation

A comprehensive Flutter package designed to bring easy and versatile rotational transformations to your widgets. Rotation offers features such as mouse position tracking and widget flip animation. You can rely on Rotation to make your Flutter applications more dynamic and engaging.


## RotatorFollower Widget

The `RotatorFollower` widget is a Flutter widget that can be used to rotate a child widget based on the position of the mouse cursor. The widget has two enums: `FollowerDistorion` and `FollowBehavior`. `FollowerDistorion` is used to specify the amount of distortion to apply to the rotation. It has three values: `none`, `light`, and `heavy`. `FollowBehavior` is used to specify the behavior of the rotation. It has two values: `normal` and `reverse`. 

![Rotator Follower example](assets/rotator_follower.gif)

## Usage

To use the `RotatorFollower` widget, simply create an instance of the widget and pass in the child widget to be rotated as the `child` parameter. You can also specify the amount of distortion to apply to the rotation using the `distorion` parameter and the behavior of the rotation using the `behavior` parameter.

```dart
RotatorFollower(
  child: Container(
    width: 200,
    height: 200,
    color: Colors.blue,
    child: Center(
      child: Text(
        'Hello, World!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    ),
  ),
)
```

## Parameters

### `child`

The widget to be rotated.

### `distorion`

The amount of distortion to apply to the rotation. `none` will emulate the 3D rotation appearance. `light` and `heavy` will create distortions in the edges of the widget.

### `behavior`

The behavior of the rotation. `normal` will rotate the widget in the direction of the mouse. `reverse` will rotate the widget in the opposite direction. Defaults to `normal`.

## Example

```dart
import 'package:flutter/material.dart';
import 'package:rotator_follower/rotator_follower.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RotatorFollower Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('RotatorFollower Demo'),
        ),
        body: Center(
          child: RotatorFollower(
            distorion: FollowerDistorion.light,
            behavior: FollowBehavior.reverse,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Hello, World!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

