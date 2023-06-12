import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rotation/rotation.dart';

void main() {
  group('RotatorFollower', () {
    testWidgets('should rotate child widget in normal direction',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: RotatorFollower(
            distorion: FollowerDistorion.none,
            behavior: FollowBehavior.normal,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      final finder = find.byType(Transform);
      final expectedTransform = Matrix4.identity()
        ..setEntry(3, 2, 0.005)
        ..rotateX(0)
        ..rotateY(0);

      expect(
        MatrixUtils.matrixEquals(
          tester.widget<Transform>(finder).transform,
          expectedTransform,
        ),
        true,
      );
      await gesture.moveTo(const Offset(100, 100));
      await tester.pumpAndSettle();

      // TODO(jrlisboa): Improve matrix4 comparison.
      expect(
          MatrixUtils.matrixEquals(
            tester.widget<Transform>(finder).transform,
            expectedTransform,
          ),
          false);
    });

    testWidgets('should rotate child widget in reverse direction',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: RotatorFollower(
            distorion: FollowerDistorion.none,
            behavior: FollowBehavior.reverse,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      final finder = find.byType(Transform);
      final expectedTransform = Matrix4.identity()
        ..setEntry(3, 2, 0.005)
        ..rotateX(0)
        ..rotateY(0);

      expect(
        MatrixUtils.matrixEquals(
          tester.widget<Transform>(finder).transform,
          expectedTransform,
        ),
        true,
      );
      await gesture.moveTo(const Offset(100, 100));
      await tester.pumpAndSettle();

      // TODO(jrlisboa): Improve matrix4 comparison.
      expect(
          MatrixUtils.matrixEquals(
            tester.widget<Transform>(finder).transform,
            expectedTransform,
          ),
          false);
    });

    testWidgets('should apply light distortion to child widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: RotatorFollower(
            distorion: FollowerDistorion.light,
            behavior: FollowBehavior.normal,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      final finder = find.byType(Transform);
      final expectedTransform = Matrix4.identity()
        ..setEntry(3, 2, 0.05)
        ..rotateX(0)
        ..rotateY(0);

      expect(
        MatrixUtils.matrixEquals(
          tester.widget<Transform>(finder).transform,
          expectedTransform,
        ),
        true,
      );
      await gesture.moveTo(const Offset(100, 100));
      await tester.pumpAndSettle();

      // TODO(jrlisboa): Improve matrix4 comparison.
      expect(
          MatrixUtils.matrixEquals(
            tester.widget<Transform>(finder).transform,
            expectedTransform,
          ),
          false);
    });

    testWidgets('should apply heavy distortion to child widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: RotatorFollower(
            distorion: FollowerDistorion.heavy,
            behavior: FollowBehavior.normal,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      final finder = find.byType(Transform);
      final expectedTransform = Matrix4.identity()
        ..setEntry(3, 2, 0.5)
        ..rotateX(0)
        ..rotateY(0);

      expect(
        MatrixUtils.matrixEquals(
          tester.widget<Transform>(finder).transform,
          expectedTransform,
        ),
        true,
      );
      await gesture.moveTo(const Offset(100, 100));
      await tester.pumpAndSettle();

      // TODO(jrlisboa): Improve matrix4 comparison.
      expect(
          MatrixUtils.matrixEquals(
            tester.widget<Transform>(finder).transform,
            expectedTransform,
          ),
          false);
    });
  });
}
