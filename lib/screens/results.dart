import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/reusable_class.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';

class Results extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  Results({@required this.bmiResult, @required  this.interpretation,  @required  this.resultText});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR'
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              child : Text(
                'YOUR RESULT',
                style: kTitleTextStyle,
              )
            ),
          ),
          Expanded(
            flex: 5,
            child : ResuableCard(
              colour: kinActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE', onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }
}
