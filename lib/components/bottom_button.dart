
import 'package:flutter/material.dart';
import '../constant.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle, @required this.onTap});
  final String buttonTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: Center(
            child: Text(
              buttonTitle,
              style: kLargerButtonTextStyle,
            ),
          ),
          width: double.infinity,
          height: kbottomContainerHeight,
          color : kbottomContainerColor
      ),
    );
  }
}
