import 'package:flutter/foundation.dart';
import 'results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_class.dart';
import '../components/icon_content.dart';
import '../constant.dart';
import '../components/rounded_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
enum Gender{
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
//  Color maleCardColour = inActiveCardColour;
//  Color femaleCardColour = inActiveCardColour;

//  void changeColour(Gender gender){
//    if(gender == Gender.male){
//      if(maleCardColour == inActiveCardColour){
//        maleCardColour = activeCardColour;
//        femaleCardColour = inActiveCardColour;
//      }
//      else{
//        maleCardColour = inActiveCardColour;
//      }
//    }
//    else{
//      if(femaleCardColour == inActiveCardColour){
//        femaleCardColour = activeCardColour;
//        maleCardColour = inActiveCardColour;
//      }
//      else{
//        femaleCardColour = inActiveCardColour;
//      }
//    }
//  }
  Gender gender;
  int height = 160;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ResuableCard(
                    onPress: (){
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    colour: gender == Gender.male ? kactiveCardColour : kinActiveCardColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE')
                  ),
                ),
                Expanded(
                  child: ResuableCard(
                    onPress: (){
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    colour: gender == Gender.female ? kactiveCardColour : kinActiveCardColour,
                    cardChild: IconContent(icon : FontAwesomeIcons.venus, label: 'FEMALE'),
                  )
                )
              ],
            )
          ),
          Expanded(
            child:ResuableCard(
              colour: kactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style : klabelTextStyle
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kbiggerFontStyle
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 26.0)
                    ),
                    child: Slider(
                      value : height.toDouble(),
                      min: 120,
                      max : 220,
//                    inactiveColor: Color(0xFF8D8E98),
//                    activeColor: Color(0xFFEB1555),
                      onChanged: (double newHeight){
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            )
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ResuableCard(
                      colour: kactiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: klabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kbiggerFontStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //this is inbuild bottom we used.
//                              FloatingActionButton(
//                                backgroundColor: kinActiveCardColour,
//                                onPressed: (){
//                                  setState(() {
//                                    weight++;
//                                  });
//                                },
//                                  child : Icon(
//                                      FontAwesomeIcons.plus,
//                                      color: Colors.white,
//                                  )
//                              ),
//                              SizedBox(
//                                width: 10.0,
//                              ),
//                              FloatingActionButton(
//                                  backgroundColor: kinActiveCardColour,
//                                  onPressed: (){
//                                    setState(() {
//                                      weight--;
//                                    });
//                                  },
//                                  child : Icon(
//                                      FontAwesomeIcons.minus,
//                                      color: Colors.white,
//                                  )
//                              )
                              //we are making your own customize button class
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              )
                            ],
                          )

                        ],
                      ),
                    )
                  ),
                  Expanded(
                      child: ResuableCard(
                        colour: kactiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: klabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kbiggerFontStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  )
                ],
              )
          ),
          BottomButton(buttonTitle: 'CALCULATE', onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Results(
                    bmiResult :calc.calculateBMI(),
                    interpretation: calc.getInterpretation(),
                    resultText: calc.getResults(),

              )));
            },
          )
        ],
      ),
    );
  }
}



