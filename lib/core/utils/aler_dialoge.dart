import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 showErrorDialog({required String msg, required BuildContext context}) {
  showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: Text(
              msg,
              style: TextStyle(color: Colors.black87),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          ));
}
