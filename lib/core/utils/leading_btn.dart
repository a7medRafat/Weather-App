import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeadingIcon extends StatelessWidget {
  final Widget widget;
  final fun;

  LeadingIcon({super.key, required this.widget, required this.fun});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: fun,
        icon: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white38, width: 0.7)),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: widget,
            )));
  }
}
