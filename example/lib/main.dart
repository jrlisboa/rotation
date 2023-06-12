import 'package:flutter/material.dart';
import 'package:rotation/src/rotator_follower.dart';

void main() {
  runApp(const MyApp());
}

/// Example app.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Example(),
    );
  }
}

/// Example parallax animation
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RotatorFollower(
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              'Hello World',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
