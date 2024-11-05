import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Animation Demo',
      theme: ThemeData.dark(),
      home: const SizeChangeScreen(),
    );
  }
}

class SizeChangeScreen extends StatefulWidget {
  const SizeChangeScreen({super.key});

  @override
  _SizeChangeScreenState createState() => _SizeChangeScreenState();
}

class _SizeChangeScreenState extends State<SizeChangeScreen> {
  double _boxSize = 100.0;

  void _toggleSize() {
    setState(() {
      _boxSize = _boxSize == 100.0 ? 150.0 : 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Box Size Change Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleSize,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: _boxSize,
            height: _boxSize,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Tap Me!',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
