// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI",
      theme: ThemeData(
          primaryColor: Color(0XFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
      home: input(),
    ),
  );
}

const Inactivecardcolour = Color(0xFFbad045);
const Activecolour = Color.fromARGB(255, 156, 175, 45);
var Malecardcolor = Inactivecardcolour;
var Femalecardcolor = Inactivecardcolour;

enum Gender { male, female }

int height = 180;
int weight = 50;
int age = 16;
int flag = -1;
String ans = "";
double bmi = 0;
String suggestion = "";

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "BMI",
        home: Scaffold(
          appBar: AppBar(
            title: Text("BMI CALCULATOR "),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Container(
                      child: const Text(
                "Your Result",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ))),
              Expanded(
                flex: 5,
                child: Card(
                  colour: Color(0xFFbad045),
                  childcard: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ans,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          (bmi.toString()).substring(0, 4),
                          style: TextStyle(
                              fontSize: 70,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          suggestion,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    child: Center(
                        child: Text(
                      "RE-CALCULATE YOUR BMI ",
                      style: TextStyle(
                        color: Color(0xFFbad045),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )));
  }
}

class input extends StatefulWidget {
  const input({Key? key}) : super(key: key);

  @override
  State<input> createState() => _inputState();
}

class _inputState extends State<input> {
  void calculate() {
    double h = height / 100;

    bmi = (weight / (h * h));
    if (bmi < 19) {
      ans = "UNDER WEIGHT";
      suggestion = "Under Weight, try to gain some weight!";
    } else if (bmi >= 19 && bmi <= 24) {
      ans = "NORMAL";
      suggestion = "You have a normal body weight !";
    } else if (bmi > 24 && bmi <= 29) {
      ans = "OVER WEIGHT";
      suggestion = "You have a over weighted body !";
    } else if (bmi > 29 && bmi <= 34) {
      ans = "OBESITY LEVEL I";
      suggestion = "You are on a Obesity level 1";
    } else if (bmi > 30 && bmi <= 34) {
      ans = "OBESITY LEVEL II";
      suggestion = "You are on a Obesity level 2";
    } else if (bmi > 34 && bmi <= 39) {
      ans = "OBESITY LEVEL III";
      suggestion = "You are on a Obesity level 3";
    } else if (bmi > 39) {
      ans = "OVER-WEIGHT";
      suggestion = "Exercise daily, and loose some weight";
    }
  }

  void tap(Gender i) {
    if (i == Gender.male) {
      flag = 1;
      if (Malecardcolor == Inactivecardcolour) {
        setState(() {
          Malecardcolor = Activecolour;
          Femalecardcolor = Inactivecardcolour;
        });
      } else {
        setState(() {
          Malecardcolor = Inactivecardcolour;
        });
      }
    } else {
      flag = 0;
      if (Femalecardcolor == Inactivecardcolour) {
        setState(() {
          Femalecardcolor = Activecolour;
          Malecardcolor = Inactivecardcolour;
        });
      } else {
        setState(() {
          Femalecardcolor = Inactivecardcolour;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        tap(Gender.male);
                      },
                      child: Card(
                        colour: Malecardcolor,
                        childcard: Iconn(
                          ico: FontAwesomeIcons.mars,
                          text: "MALE",
                          color: Color(0xFF),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        tap(Gender.female);
                      },
                      child: Card(
                        colour: Femalecardcolor,
                        childcard: Iconn(
                          ico: FontAwesomeIcons.venus,
                          text: "FEMALE",
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Row(children: [
              Expanded(
                child: Card(
                  colour: Color(0xFFbad045),
                  childcard: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontSize: 33),
                            ),
                            Text(
                              " cm",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontSize: 20),
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            thumbColor: Colors.black,
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120,
                              max: 220,
                              onChanged: (double newvalue) {
                                setState(() {
                                  height = newvalue.round();
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ])),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Card(
                    colour: Color(0xFFbad045),
                    childcard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                splashColor: Colors.black,
                                child: Icon(Icons.remove),
                                backgroundColor: Colors.black),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              splashColor: Colors.black,
                              child: Icon(Icons.add),
                              backgroundColor: Colors.black,
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                    child: Card(
                      colour: Color(0xFFbad045),
                      childcard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(height: 7),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  splashColor: Colors.black,
                                  child: Icon(Icons.remove),
                                  backgroundColor: Colors.black),
                              SizedBox(
                                width: 20,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                splashColor: Colors.pink,
                                child: Icon(Icons.add),
                                backgroundColor: Colors.black,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                calculate();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Result();
                  }),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 70,
                  child: Center(
                      child: Text(
                    "CALCULATE YOUR BMI ",
                    style: TextStyle(
                      color: Color(0xFFbad045),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  color: Colors.black,
                ),
              ),
            )
          ],
        )));
  }
}

class Iconn extends StatelessWidget {
  final IconData ico;
  final String text;
  final Color color;
  const Iconn({required this.ico, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ico,
          size: 80.0,
          color: Colors.white,
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 15,
        ),
        Text(text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}

class Card extends StatelessWidget {
  final Color colour;
  final Widget? childcard;
  final ShapeBorder? shape;
  Card({required this.colour, this.childcard, this.shape});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childcard,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
