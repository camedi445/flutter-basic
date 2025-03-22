import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60.0,
        width: 60.0,
        child: CircularProgressIndicator(
          color: Color(0xFF1FCC79),
        ),
      ),
    );
  }
}
