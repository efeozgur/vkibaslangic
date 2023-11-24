import 'package:bmicalc/dosyalar/sabitler.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bilesenler/bottombutton.dart';
import '../bilesenler/reusable.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VKİ HESAPLAYICI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(15.0),
                    alignment: Alignment.center,
                    child: Icon(
                      FontAwesomeIcons.calculator,
                      size: 70,
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              onPress: () {},
              colour: kActiveCardColour,
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
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'YENİDEN HESAPLA',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
