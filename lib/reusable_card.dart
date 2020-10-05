import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: kContainerMargin,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
      ),
    );
  }
}
