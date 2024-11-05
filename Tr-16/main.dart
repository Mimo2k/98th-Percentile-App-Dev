import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade Animation Demo',
      theme: ThemeData.dark(),
      home: const FadeTextScreen(),
    );
  }
}

class FadeTextScreen extends StatefulWidget {
  const FadeTextScreen({super.key});

  @override
  _FadeTextScreenState createState() => _FadeTextScreenState();
}

class _FadeTextScreenState extends State<FadeTextScreen> {
  double _opacity = 1.0;

  void _toggleFade() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Fade Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: const Text(
                'Hello, Flutter!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleFade,
              child: const Text('Toggle Fade'),
            ),
          ],
        ),
      ),
    );
  }
}
