import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Padding around the entire layout
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .center, // Aligns widgets in the center horizontally
          children: <Widget>[
            // Profile Image
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/profile_image.png'), // Replace with your image
            ),
            const SizedBox(
                height: 20), // Adds space between the avatar and text

            // Name
            const Text(
              'John Doe', // Replace with your name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10), // Space between the name and bio

            // Bio
            const Text(
              'Flutter Developer & Designer', // Replace with your description
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 30), // Space before description

            // Expanded Section (for description or other content)
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'I am passionate about mobile development and designing beautiful apps. '
                  'I enjoy experimenting with new design techniques and creating functional apps.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
