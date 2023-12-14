import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideTextWidget extends StatelessWidget {
  final String text;

  const SideTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
