import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {

  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: SizedBox(
        height: 0.4,
        child: Container(
          color: Colors.white38,
        ),
      ),
    );
  }
}
