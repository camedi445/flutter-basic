import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.call, 'Call'),
                _buildActionButton(Icons.location_on, 'Route'),
                _buildActionButton(Icons.share, 'Share'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String actionText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 40.0,
          ),
          Container(
            child: Text(
              actionText,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
