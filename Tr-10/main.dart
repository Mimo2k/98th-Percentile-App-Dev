import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  // Normal increment and decrement functions
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // Uncomment the code below to implement the Opposite Button Challenge
  /*
  // Opposite button functionality
  void _incrementOpposite() {
    setState(() {
      _counter--;
    });
  }

  void _decrementOpposite() {
    setState(() {
      _counter++;
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pressed the button this many times:',
            ),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 36),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Normal buttons
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: _decrementCounter,
                  child: const Text('Decrement'),
                ),

                // Uncomment the buttons below for the Opposite Button Challenge
                /*
                ElevatedButton(
                  onPressed: _incrementOpposite,
                  child: const Text('Increment (Opposite)'),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: _decrementOpposite,
                  child: const Text('Decrement (Opposite)'),
                ),
                */
              ],
            ),
          ],
        ),
      ),
    );
  }
}
