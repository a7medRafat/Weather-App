import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class BackWidget extends StatelessWidget {

  const BackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        ZoomDrawer.of(context)!.toggle();
      },
      icon: Container(
        alignment: AlignmentDirectional.topStart,
        decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white54, width: 0.4)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(CupertinoIcons.back,color: Colors.white54,),
        ),
      ),

    );
  }
}
