import 'package:flutter/material.dart';
import 'package:rotation/rotation.dart';

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
class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  RotatorFlipState _flipState = RotatorFlipState.showFirst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _flipState == RotatorFlipState.showFirst
                ? _flipState = RotatorFlipState.showSecond
                : _flipState = RotatorFlipState.showFirst;
          });
        },
        child: RotatorFlip(
          duration: const Duration(milliseconds: 400),
          flipState: _flipState,
          firstChild: Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'Hello World 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          secondChild: Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                'Hello World 2',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
