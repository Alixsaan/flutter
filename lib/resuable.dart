import 'package:flutter/material.dart';

class Reusable extends StatelessWidget {
  final Color color;
  final Widget? cardchild;
  final Function? onpress;

  Reusable({required this.color, this.cardchild,this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onpress as void Function()?,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}