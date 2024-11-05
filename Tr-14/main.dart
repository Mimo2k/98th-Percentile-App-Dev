import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Navigation with Message Passing',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Uncomment the code below to enable the student activity of message passing
            /*
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(message: 'Hello from Home Screen!'),
              ),
            );
            */
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

// Updated SecondScreen with a parameter for receiving a message
class SecondScreen extends StatelessWidget {
  // Add a parameter to receive the message from HomeScreen
  final String message;
  const SecondScreen({super.key, this.message = ''});  // Default empty message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home Screen'),
            ),
            // Uncomment the code below to display the message passed from HomeScreen
            /*
            Text(
              message,
              style: const TextStyle(fontSize: 18),
            ),
            */
          ],
        ),
      ),
    );
  }
}
