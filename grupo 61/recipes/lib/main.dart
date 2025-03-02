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
        body: _buildFlag(),
      ),
    );
  }

  Widget _buildFlag() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(
                  Icons.call,
                  color: Colors.blue,
                  size: 48.0,
                ),
                Container(
                  child: Text(
                    'Call',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.gps_fixed,
                  color: Colors.blue,
                  size: 48.0,
                ),
                Container(
                  child: Text(
                    'Route',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.share,
                  color: Colors.blue,
                  size: 48.0,
                ),
                Container(
                  child: Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
