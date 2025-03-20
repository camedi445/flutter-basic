import 'package:flutter/material.dart';

class AvatarInfo extends StatelessWidget {
  const AvatarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: SizedBox(
            height: 42.0,
            width: 42.0,
            child: Image.network(
              fit: BoxFit.fill,
              'https://images.pexels.com/photos/5682847/pexels-photo-5682847.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Camilo Medina',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
        )
      ],
    );
  }
}
