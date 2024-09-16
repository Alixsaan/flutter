import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() onTap;
  final String buttontitle;

  Button({required this.onTap, required this.buttontitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45.0,
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: Color(0xFFEB1555),
        ),
        child: Center(
          child: Text(
            buttontitle,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}