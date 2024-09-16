

import 'package:bmi/input_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi/resuable.dart';
import 'package:bmi/button.dart';


class Resultpage extends  StatelessWidget{

Resultpage({required this.bmiresult, required this.resulttext,required this.interpre});

final String  bmiresult;
final String resulttext;
final  String interpre;


@override

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Center(child: Text( 'BMI CALCULATOR',
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 50,
      ),
      
      ),
      ),
    ),
    body:  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child:Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'your result',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              ),
          ) ,
          ),
          Expanded(
        flex: 5,
        child: Reusable(
          color: activecolor,
          cardchild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                resulttext.toUpperCase(),
                style:TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ), 
              ),
              Text(
                bmiresult,
                style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              ),
              Text(
                interpre,
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              ),
            ],
          ),
        ),
          ),
         Button(
           buttontitle: 'RE-CALCULATE',
           onTap: (){
            Navigator.pop(context);
           },
          ),
      ],
    ),
  );
  }
}