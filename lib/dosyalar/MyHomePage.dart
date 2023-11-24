import 'package:bmicalc/bilesenler/roundicon.dart';
import 'package:bmicalc/dosyalar/hesaplama.dart';
import 'package:bmicalc/dosyalar/sabitler.dart';
import 'package:bmicalc/bilesenler/reusable.dart';
import 'package:bmicalc/dosyalar/sonucsayfasi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bilesenler/bottombutton.dart';
import '../bilesenler/iconcontent.dart';

enum Cinsiyet {
  Bayan,
  Erkek,
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Cinsiyet secilenCins = Cinsiyet.Bayan;
  int boy = 180;
  int kilo = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: secilenCins == Cinsiyet.Erkek
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: "ERKEK",
                  ),
                  onPress: () {
                    setState(() {
                      secilenCins = Cinsiyet.Erkek;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: secilenCins == Cinsiyet.Bayan
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'KADIN',
                  ),
                  onPress: () {
                    setState(() {
                      secilenCins = Cinsiyet.Bayan;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Boy", style: kNumberTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(boy.toString(), style: kNumberTextStyle),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xffffffff),
                      activeTrackColor: Color(0xff757575),
                      thumbColor: Color(0xffb800ff),
                      overlayColor: Color(0x2946003c),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: boy.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          boy = newValue.round();
                        });
                      },
                    ))
              ],
            ),
            onPress: () {},
            colour: kActiveCardColour,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Kilo",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        kilo.toString() + " KG",
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  kilo--;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                kilo++;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  onPress: () {},
                ),
              ),
            ],
          ),
        ),
        BottomButton(
          onTap: () {
            CalculatorBrain hesapla =
                CalculatorBrain(height: boy, weight: kilo);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          bmiResult: hesapla.calculateBMI(),
                          interpretation: hesapla.getInterpretation(),
                          resultText: hesapla.getResult(),
                        )));
          },
          buttonTitle: "HESAPLA",
        )
      ]),
    );
  }
}
