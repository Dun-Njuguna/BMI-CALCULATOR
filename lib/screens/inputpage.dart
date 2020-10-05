import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../components/RoundIconButton.dart';
import '../components/NavigationButton.dart';
import '../constants.dart';
import 'package:bmi_calculator/bmi_calculator.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = kDefaultHeight;
  int weight = 40;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          child:
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ReusableCard(
                              onPress: () {
                                setState(() {
                                  selectedGender = Gender.Male;
                                });
                              },
                              colour: selectedGender == Gender.Male
                                  ? kActiveCardColor
                                  : kInactiveCardColor,
                              cardChild: IconContent(
                                icon: FontAwesomeIcons.mars,
                                label: 'Male',
                              ),
                            ),
                          ),
                          Expanded(
                            child: ReusableCard(
                              onPress: () {
                                setState(() {
                                  selectedGender = Gender.Female;
                                });
                              },
                              colour: selectedGender == Gender.Female
                                  ? kActiveCardColor
                                  : kInactiveCardColor,
                              cardChild: IconContent(
                                icon: FontAwesomeIcons.venus,
                                label: 'Female',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Height',
                              style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: kBoldNumberTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                )
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: kSliderInActiveColor,
                                activeTrackColor: Colors.white,
                                thumbColor: kSliderActiveColor,
                                overlayColor: kSliderOverlayColor,
                                thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: kEnabledThumbRadius,
                                ),
                                overlayShape: RoundSliderOverlayShape(
                                  overlayRadius: kOverlayRadius,
                                ),
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: kMinHeight,
                                max: kMaxHeight,
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
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
                        children: <Widget>[
                          Expanded(
                            child: ReusableCard(
                              colour: kActiveCardColor,
                              cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Weight',
                                    style: kLabelTextStyle,
                                  ),
                                  Text(
                                    weight.toString(),
                                    style: kBoldNumberTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RoundIconButton(
                                        iconData: FontAwesomeIcons.minus,
                                        onPress: () {
                                          setState(() {
                                            weight -= 1;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: kSizedBoxWidth,
                                      ),
                                      RoundIconButton(
                                        iconData: FontAwesomeIcons.plus,
                                        onPress: () {
                                          setState(() {
                                            weight += 1;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: ReusableCard(
                              colour: kActiveCardColor,
                              cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Age',
                                    style: kLabelTextStyle,
                                  ),
                                  Text(
                                    age.toString(),
                                    style: kBoldNumberTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RoundIconButton(
                                        iconData: FontAwesomeIcons.minus,
                                        onPress: () {
                                          setState(() {
                                            age -= 1;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: kSizedBoxWidth,
                                      ),
                                      RoundIconButton(
                                        iconData: FontAwesomeIcons.plus,
                                        onPress: () {
                                          setState(() {
                                            age += 1;
                                          });
                                        },
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
                    NavigationButton(
                      onTap: () {
                        Calculator calc =
                            Calculator(height: height, weight: weight);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultsPage(
                              bimResult: calc.calculateBmi(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            ),
                          ),
                        );
                      },
                      buttonTitle: 'Calculate',
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
