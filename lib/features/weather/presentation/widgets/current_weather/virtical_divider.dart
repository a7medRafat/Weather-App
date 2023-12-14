import 'package:flutter/material.dart';

class SecondDivider extends StatelessWidget {

  const SecondDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 0.5,
        height: 100,
        color: Colors.white38
      ),
    );
  }
}
