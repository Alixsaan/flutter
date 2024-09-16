import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/icon.dart';
import 'package:bmi/resuable.dart';
import 'package:bmi/button.dart';
import 'package:bmi/calculate.dart';
import 'package:bmi/result.dart';
import 'package:bmi/rounicaon.dart';

const buttonholder = 80.0;
const activecolor = Color(0xFF1D1E33);
const inactivecolor = Color(0xFF111328);
const buttoncolor = Color(0xFFEB1555);
enum Gender {
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  InputPageState createState() => InputPageState();
}
class InputPageState extends State<InputPage> {
  Gender? selectedgender;
  double height=180;
 double  weight= 60;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable(
                    onpress:(){
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    } ,
                    color: selectedgender == Gender.male ? activecolor : inactivecolor,
                    cardchild: IconContent(
                      icons: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    onpress: (){
                      setState(() {
                        selectedgender =Gender.female;
                      });
                    },
                    color: selectedgender == Gender.female ? activecolor : inactivecolor,
                    cardchild: IconContent(
                      icons: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusable(color: activecolor,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HEIGHT",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 25.0,
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                  Text(
                    height.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 50,
                    color: Colors.white,
                  ),
                  ),
                  Text('CM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:15,
                    fontWeight: FontWeight.w600, 
                  ),
                  
                  ),
                ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor:Color(0xFF8D8E98), 
                    activeTrackColor: Colors.white,
                    overlayColor: Color(0x99EB1555),
                    thumbColor: Colors.pink,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                     min: 120.0,
                     max: 230.0,
                     onChanged: (double newvalue){
                      setState(() {
                        height = newvalue;
                      });
                     },
                    ),
                ),
              ],
            ),
            
            ),
          ),
          Expanded(
            child: Row(
              children: [
              Expanded(
                  child: Reusable(color: activecolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: TextStyle(
                     fontWeight: FontWeight.normal,
                      color: Colors.white,
                    fontSize: 25.0,
                ),
                      ),
                      Text(
                        weight.toString(),
                        style:TextStyle(
                    color: Colors.white,
                    fontSize:15,
                    fontWeight: FontWeight.w600, 
                  ),
                  
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                             icon:Icon(FontAwesomeIcons.minus),
                             ),
                           SizedBox(
                            width: 10.0,
                           ),
                           IconButton(
                            onPressed:(){
                            setState(() {
                              weight++;
                            });
                            } ,
                            icon: Icon(FontAwesomeIcons.plus),
                            ),

                        ],
                      ),
                      
                    ],
                  ),
                  
                  ),
                ),
                Expanded(
                  child: Reusable(color: activecolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: TextStyle(
                     fontWeight: FontWeight.normal,
                      color: Colors.white,
                    fontSize: 25.0,
                ),
                      ),
                      Text(
                        age.toString(),
                        style:TextStyle(
                    color: Colors.white,
                    fontSize:15,
                    fontWeight: FontWeight.w600, 
                  ),
                  
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                             icon:Icon(FontAwesomeIcons.minus),
                             ),
                           SizedBox(
                            width: 10.0,
                           ),
                           IconButton(
                            onPressed:(){
                            setState(() {
                              age++;
                            });
                            } ,
                            icon: Icon(FontAwesomeIcons.plus),
                            ),

                        ],
                      ),
                      
                    ],
                  ),
                  
                  ),
                ),
              ],
            ),
          ),
          Button(
            buttontitle: 'CALCULATE',
            onTap:(){
              Bmilogic cal =Bmilogic(height: height, weight: weight);

              Navigator.push(
                context, 
              MaterialPageRoute(
                builder: (context) => Resultpage(
                  bmiresult:cal.calculateBmi(),
                  resulttext: cal.getResult(),
                  interpre: cal.getInterpretation(),
                )
              )
              );
            } ,
          ),
        ],
      ),
    );
  }
}