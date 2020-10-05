import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../components/NavigationButton.dart';

class ResultsPage extends StatelessWidget {
  final String bimResult;
  final String resultText;
  final String interpretation;

  ResultsPage({
    @required this.bimResult,
    @required this.resultText,
    @required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Your Result',
                            style: kTitleTextStyle,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: ReusableCard(
                          colour: kActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                resultText.toUpperCase(),
                                style: kResultTextStyle,
                              ),
                              Text(
                                bimResult,
                                style: kBmiTextStyle,
                              ),
                              Text(
                                interpretation,
                                style: kBodyTextStyle,
                                textAlign: TextAlign.center,
                              ),
                              NavigationButton(
                                buttonTitle: 'RE-CALCULATE',
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
