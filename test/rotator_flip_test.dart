import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rotation/rotation.dart';

void main() {
  group('RotatorFlip', () {
    testWidgets('renders first child by default', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: RotatorFlip(
            firstChild: Text('First Child'),
            secondChild: Text('Second Child'),
            duration: Duration(milliseconds: 500),
          ),
        ),
      );

      expect(find.text('First Child'), findsOneWidget);
      expect(find.text('Second Child'), findsNothing);
    });

    testWidgets('flips to second child when flipState is showSecond',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: RotatorFlip(
            firstChild: Text('First Child'),
            secondChild: Text('Second Child'),
            duration: Duration(milliseconds: 500),
            flipState: RotatorFlipState.showSecond,
          ),
        ),
      );

      expect(find.text('First Child'), findsNothing);
      expect(find.text('Second Child'), findsOneWidget);
    });

    testWidgets('flips with the given duration', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: RotatorFlip(
            firstChild: Text('First Child'),
            secondChild: Text('Second Child'),
            duration: Duration(milliseconds: 1000),
          ),
        ),
      );

      final AnimatedSwitcher animatedSwitcher =
          tester.widget<AnimatedSwitcher>(find.byType(AnimatedSwitcher));

      expect(animatedSwitcher.duration, const Duration(milliseconds: 1000));
    });

    testWidgets('flips with the given first curve',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: RotatorFlip(
            firstChild: Text('First Child'),
            secondChild: Text('Second Child'),
            duration: Duration(milliseconds: 500),
            firstCurve: Curves.easeInOut,
          ),
        ),
      );

      final AnimatedSwitcher animatedSwitcher =
          tester.widget<AnimatedSwitcher>(find.byType(AnimatedSwitcher));

      expect(animatedSwitcher.switchInCurve, Curves.easeInOut);
    });

    testWidgets('flips with the given second curve',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: RotatorFlip(
            firstChild: Text('First Child'),
            secondChild: Text('Second Child'),
            duration: Duration(milliseconds: 500),
            secondCurve: Curves.easeInOut,
          ),
        ),
      );

      final AnimatedSwitcher animatedSwitcher =
          tester.widget<AnimatedSwitcher>(find.byType(AnimatedSwitcher));

      expect(animatedSwitcher.switchOutCurve, Curves.easeInOut);
    });
  });
}
