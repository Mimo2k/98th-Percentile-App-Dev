import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icons and Images Demo',
      theme: ThemeData.dark(),
      home: const IconImageScreen(),
    );
  }
}

// Single screen with an icon and two images (student activity image is commented out)
class IconImageScreen extends StatelessWidget {
  const IconImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icons and Images'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Displaying an icon
            const Icon(
              Icons.star,
              size: 80,
              color: Colors.amber,
            ),
            const SizedBox(height: 20),

            // Displaying the first image from the internet
            Image.network(
              'https://example.com/your-image-url.png', 
              // copy image url from google by right click and selecting copy image url
              width: 150,
              height: 150,
            ),

            const SizedBox(height: 20),

            // Student Activity: Uncomment to add a second image
            /*
            Image.network(
              'https://example.com/your-image-url.png',  // Replace with a URL of your choice
              width: 100,
              height: 100,
            ),
            */
          ],
        ),
      ),
    );
  }
}
