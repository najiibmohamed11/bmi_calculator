import 'dart:ffi';

import 'package:flutter/material.dart';

class RiusableWidget extends StatelessWidget {
  RiusableWidget(this.color, {this.costum,  this.onpressed});
  final Color color;
  final Widget? costum;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: costum,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
