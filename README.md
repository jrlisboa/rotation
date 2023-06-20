# Rotation

A comprehensive Flutter package designed to bring easy and versatile rotational transformations to your widgets. Rotation offers features such as mouse position tracking and widget flip animation. You can rely on Rotation to make your Flutter applications more dynamic and engaging.

## RotatorFlip Widget

The `RotatorFlip` widget is a Flutter widget that allows you to create flip animations between two child widgets.

![Rotator Flip example](https://github.com/jrlisboa/rotation/blob/main/assets/rotator_flip.gif?raw=true)

```dart
RotatorFlip(
  firstChild: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
  ),
  secondChild: Container(
    width: 100,
    height: 100,
    color: Colors.red,
  ),
  duration: Duration(seconds: 1),
  flipState: RotatorFlipState.showFirst,
  direction: RotatorFlipDirection.horizontal,
)
```

In this example, the `RotatorFlip` widget is used to create a flip animation between a blue `Container` and a red `Container`. The `duration` parameter is used to set the duration of the flip animation to 1 second. The `flipState` parameter is used to set the initial state of the flipper to `RotatorFlipState.showFirst`, which means that the blue `Container` is visible. The `direction` parameter is used to set the direction of the flip animation to `RotatorFlipDirection.horizontal`, which means that the flip animation will be a horizontal flip.

## RotatorFollower Widget

The `RotatorFollower` widget is a Flutter widget that can be used to rotate a child widget based on the position of the mouse cursor.


![Rotator Follower example](https://github.com/jrlisboa/rotation/blob/main/assets/rotator_follower.gif?raw=true)

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
  distorion: FollowerDistorion.light,
  behavior: FollowBehavior.reverse,
)
```
In this example, the `RotatorFollower` widget is used to rotate a blue `Container` with a centered `Text` widget. The `distorion` parameter is used to specify the amount of distortion to apply to the rotation, which is set to `FollowerDistorion.light`. The `behavior` parameter is used to specify the behavior of the rotation, which is set to `FollowBehavior.reverse`.