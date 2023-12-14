import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  final controller;
  final String msg;
  final String hint;


  TextField({super.key,
    required this.controller,
    required this.msg,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme
          .of(context)
          .textTheme
          .bodySmall,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return msg;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme
            .of(context)
            .textTheme
            .bodySmall,
        filled: false,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white54, width: 0.7),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),
      ),
    );
  }
}

