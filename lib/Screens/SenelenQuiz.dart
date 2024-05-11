import 'dart:math';

import 'package:eyeqmother/Screens/colorchangedemo.dart';
import 'package:eyeqmother/Screens/report.dart';
import 'package:eyeqmother/components/page_transmission.dart';
import 'package:eyeqmother/flutter_flow/flutter_flow_animations.dart';
import 'package:eyeqmother/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';

late List<String> dataList = [];
late List<String> dataList1 = [];

class SenellenQuizWidget extends StatefulWidget {
  final int screen;
  const SenellenQuizWidget({super.key, required this.screen});

  @override
  State<SenellenQuizWidget> createState() => _SenellenQuizWidgetState();
}

class _SenellenQuizWidgetState extends State<SenellenQuizWidget>
    with TickerProviderStateMixin {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  // var hasButtonTriggered = false;
  // Color firstButtonColor = Colors.white; // Initial color for the first button
  // Color secondButtonColor = Colors.white; // Initial color for the second button
  // Color thirdButtonColor = Colors.white; // Initial color for the third button

  // Color firstButtonColortext =
  //     Color(0xFF4B39EF); // Initial color for the first button
  // Color secondButtonColortext =
  //     Color(0xFF4B39EF); // Initial color for the second button
  // Color thirdButtonColortext =
  //     Color(0xFF4B39EF); // Initial color for the third button

  // List<String> resultList = []; // Initialize an empty list to store results
  // int currentIndex = 0; // Initialize a counter for the current index,

  // var option1 = '';
  // late String randomLetter3;
  // late String randomLetter2;
  // final animationsMap = {
  //   'progressBarOnPageLoadAnimation': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     effects: [
  //       FadeEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: 0,
  //         end: 1,
  //       ),
  //       MoveEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: Offset(-50, 0),
  //         end: Offset(0, 0),
  //       ),
  //       ScaleEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: Offset(0.7, 0.7),
  //         end: Offset(1, 1),
  //       ),
  //     ],
  //   ),
  //   'buttonOnPageLoadAnimation': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     applyInitialState: false,
  //     effects: [
  //       MoveEffect(
  //         curve: Curves.easeInOut,
  //         delay: 0.ms,
  //         duration: 600.ms,
  //         begin: Offset(0, 0),
  //         end: Offset(0, 0),
  //       ),
  //     ],
  //   ),
  //   'buttonOnActionTriggerAnimation': AnimationInfo(
  //     trigger: AnimationTrigger.onActionTrigger,
  //     applyInitialState: false,
  //     effects: [
  //       ScaleEffect(
  //         curve: Curves.elasticOut,
  //         delay: 30.ms,
  //         duration: 500.ms,
  //         begin: Offset(0.7, 1),
  //         end: Offset(1, 1),
  //       ),
  //     ],
  //   ),
  // };
  // late bool status;
  // late bool status1 = false;
  // late double normalizedScreen;
  // int screen = 0;
  // late String option;
  // final random = Random();
  // late int randomNumber;

  // late List<String> dataList = [];
  // late List<String> dataList1 = [];

  // @override
  // void initState() {
  //   super.initState();

  //   // number();

  //   setState(() {
  //     screen = widget.screen;
  //     normalizedScreen = screen / 10.0;
  //     final random3 = Random();
  //     int randomIndex3 = random3.nextInt(26);
  //     int asciiCode3 = 65 + randomIndex3;
  //     randomLetter3 = String.fromCharCode(asciiCode3);

  //     final random2 = Random();
  //     int randomIndex2 = random2.nextInt(26);
  //     int asciiCode2 = 65 + randomIndex2;
  //     randomLetter2 = String.fromCharCode(asciiCode2);
  //   });
  //   status = false;

  //   setState(() {
  //     firstButtonColor = Colors.white;
  //     secondButtonColor = Colors.white;
  //     thirdButtonColor = Colors.white;

  //     randomNumber = random.nextInt(3);
  //   });

  //   setupAnimations(
  //     animationsMap.values.where((anim) =>
  //         anim.trigger == AnimationTrigger.onActionTrigger ||
  //         !anim.applyInitialState),
  //     this,
  //   );
  //   _initializeTextInfoList();
  //   randomChange();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   animationsMap.values.forEach((animation) => animation.controller.dispose());
  // }

  var hasButtonTriggered = false;

  final List<String> myList = [
    "7",
    "10",
    "9",
    "74",
    "1",
    "12",
    "39",
    "2",
    "26",
    "4",
    "15",
    "96",
    "3",
    "29",
    "16",
    "27",
    "57",
    "5"
  ];

  Color firstButtonColor = Colors.white; // Initial color for the first button
  Color secondButtonColor = Colors.white; // Initial color for the second button
  Color thirdButtonColor = Colors.white; // Initial color for the third button

  Color firstButtonColortext =
      Color(0xFF4B39EF); // Initial color for the first button
  Color secondButtonColortext =
      Color(0xFF4B39EF); // Initial color for the second button
  Color thirdButtonColortext =
      Color(0xFF4B39EF); // Initial color for the third button

  List<String> resultList = []; // Initialize an empty list to store results
  int currentIndex = 0; // Initialize a counter for the current index,

  var option1 = '';
  String randomLetter3 = "";
  late String randomLetter2 = '';

  final animationsMap = {
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: false,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 30.ms,
          duration: 500.ms,
          begin: Offset(0.7, 1),
          end: Offset(1, 1),
        ),
      ],
    ),
  };

  late bool status = false;
  late bool status1 = false;
  double normalizedScreen = 1;
  int screen = 0;
  late String option;
  final random = Random();
  late int randomNumber;

  @override
  void initState() {
    super.initState();

    // number();

    setState(() {
      screen = widget.screen;
      normalizedScreen = screen / 10.0;
      final random3 = Random();
      int randomIndex3 = random3.nextInt(26);
      int asciiCode3 = 65 + randomIndex3;
      randomLetter3 = String.fromCharCode(asciiCode3);

      final random2 = Random();
      int randomIndex2 = random2.nextInt(26);
      int asciiCode2 = 65 + randomIndex2;
      randomLetter2 = String.fromCharCode(asciiCode2);
    });
    status = false;

    setState(() {
      firstButtonColor = Colors.white;
      secondButtonColor = Colors.white;
      thirdButtonColor = Colors.white;

      randomNumber = random.nextInt(3);
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
    _initializeTextInfoList();
    randomChange();
  }

  @override
  void dispose() {
    animationsMap.values.forEach((animation) => animation.controller.dispose());
    super.dispose();
  }

  List<List<TextInfo>> _textInfoList = [];
  void _initializeTextInfoList() {
    // Define text information for each row
    _textInfoList = [
      [TextInfo("E", 50.0, Colors.black)],
      [TextInfo("P ", 45.0, Colors.black), TextInfo(" F", 45.0, Colors.black)],
      [
        TextInfo("T    ", 40.0, Colors.black),
        TextInfo("O   ", 40.0, Colors.black),
        TextInfo(" Z  ", 40.0, Colors.black),
        TextInfo(" S", 40.0, Colors.black)
      ],
      [
        TextInfo("  L  ", 35.0, Colors.black),
        TextInfo("   P  ", 35.0, Colors.black),
        TextInfo("  E  ", 35.0, Colors.black),
        TextInfo("  d ", 35.0, Colors.black),
      ],
      [
        TextInfo("P   ", 30.0, Colors.black),
        TextInfo(" E   ", 30.0, Colors.black),
        TextInfo(" D   ", 30.0, Colors.black),
        TextInfo(" F   ", 30.0, Colors.black),
        TextInfo(" C   ", 30.0, Colors.black),
      ],
      [
        TextInfo("E    ", 25.0, Colors.black),
        TextInfo("D    ", 25.0, Colors.black),
        TextInfo("F    ", 25.0, Colors.black),
        TextInfo("C    ", 25.0, Colors.black),
        TextInfo("O    ", 25.0, Colors.black),
        TextInfo("Z    ", 25, Colors.black)
      ],
      [
        TextInfo("E      ", 20.0, Colors.black),
        TextInfo("F      ", 20.0, Colors.black),
        TextInfo("L      ", 20.0, Colors.black),
        TextInfo("O      ", 20.0, Colors.black),
        TextInfo("P      ", 20.0, Colors.black),
        TextInfo("D      ", 20.0, Colors.black),
        TextInfo("Z      ", 20.0, Colors.black)
      ],
      [
        TextInfo("D      ", 15.0, Colors.black),
        TextInfo("F      ", 15.0, Colors.black),
        TextInfo("O      ", 15.0, Colors.black),
        TextInfo("E      ", 15.0, Colors.black),
        TextInfo("P      ", 15.0, Colors.black),
        TextInfo("C      ", 15.0, Colors.black),
        TextInfo("T      ", 15.0, Colors.black),
        TextInfo("E      ", 15.0, Colors.black)
      ],
      [
        TextInfo("L       ", 10.0, Colors.black),
        TextInfo("E       ", 10, Colors.black),
        TextInfo("D       ", 10.0, Colors.black),
        TextInfo("F       ", 10.0, Colors.black),
        TextInfo("O       ", 10.0, Colors.black),
        TextInfo("P       ", 10.0, Colors.black),
        TextInfo("C       ", 10.0, Colors.black),
        TextInfo("E       ", 10.0, Colors.black),
        TextInfo("T       ", 10.0, Colors.black)
      ],
      [
        TextInfo("F         ", 7.0, Colors.black),
        TextInfo("D         ", 7, Colors.black),
        TextInfo("P         ", 7.0, Colors.black),
        TextInfo("L         ", 7.0, Colors.black),
        TextInfo("T         ", 7.0, Colors.black),
        TextInfo("O         ", 7.0, Colors.black),
        TextInfo("E         ", 7.0, Colors.black),
        TextInfo("C         ", 7.0, Colors.black),
        TextInfo("D         ", 7.0, Colors.black)
      ],
      [
        TextInfo("P           ", 5.0, Colors.black),
        TextInfo("E       ", 5, Colors.black),
        TextInfo("S       ", 5.0, Colors.black),
        TextInfo("O       ", 5.0, Colors.black),
        TextInfo("L       ", 5.0, Colors.black),
        TextInfo("Z       ", 5.0, Colors.black),
        TextInfo("C       ", 5.0, Colors.black),
        TextInfo("F       ", 5.0, Colors.black),
        TextInfo("T       ", 5.0, Colors.black),
        TextInfo("D       ", 5.0, Colors.black)
      ],
    ];
  }

  void randomChange() {
    Random random = Random();
    int row = random.nextInt(_textInfoList.length);
    int col = random.nextInt(_textInfoList[row].length);

    // Reset color of all texts
    for (int i = 0; i < _textInfoList.length; i++) {
      for (int j = 0; j < _textInfoList[i].length; j++) {
        setState(() {
          _textInfoList[i][j].color = Colors.black;
        });
      }
    }

    // Set color of random text to red
    setState(() {
      _textInfoList[row][col].color = Colors.red;
      print(_textInfoList[row][col].text);
      option1 = _textInfoList[row][col].text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _textInfoList.length,
                    (row) {
                      // Check if this is the 4th row
                      if (row == 6) {
                        return Column(
                          children: [
                            // Your existing row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                _textInfoList[row].length,
                                (col) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0.0),
                                  child: Text(
                                    _textInfoList[row][col].text,
                                    style: TextStyle(
                                      fontSize:
                                          _textInfoList[row][col].fontSize,
                                      color: _textInfoList[row][col].color,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Container to add after the 4th row
                            // Generated code for this Container Widget...
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.height * 0.01,
                              decoration: BoxDecoration(
                                color: Color(0xFFFD0000),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            )
                          ],
                        );
                      }
                      // Check if this is the specific row after which you want to add the container
                      else if (row == 10 - 1) {
                        return Column(
                          children: [
                            // Your existing row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                _textInfoList[row].length,
                                (col) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0.0),
                                  child: Text(
                                    _textInfoList[row][col].text,
                                    style: TextStyle(
                                      fontSize:
                                          _textInfoList[row][col].fontSize,
                                      color: _textInfoList[row][col].color,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Container to add after the specific row
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.01,
                              decoration: BoxDecoration(
                                color: Color(0xFF4AB40E),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            )
                          ],
                        );
                      } else {
                        // For other rows, just return the row as before
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _textInfoList[row].length,
                            (col) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                _textInfoList[row][col].text,
                                style: TextStyle(
                                  fontSize: _textInfoList[row][col].fontSize,
                                  color: _textInfoList[row][col].color,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CircularPercentIndicator(
                percent: normalizedScreen,
                radius: 20,
                lineWidth: 4,
                animation: true,
                animateFromLastPercent: true,
                progressColor: Color(0xFF4B39EF),
                backgroundColor: Color(0xFFE0E3E7),
                center: Text(
                  '${screen}',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0xFF14181B),
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        setState(() {
                          firstButtonColor = Color(0xFF4B39EF);
                          secondButtonColor = Colors.white;
                          thirdButtonColor = Colors.white;
                          status = true;
                          secondButtonColortext = Color(0xFF4B39EF);
                          firstButtonColortext = Colors.white;
                          thirdButtonColortext = Color(0xFF4B39EF);

                          if (screen == 1) {
                            dataList = [];
                            dataList1 = [];
                          }
                          dataList.add(option1.trim());
                          dataList1.add(option1.trim());
                        });
                        print('First button pressed ...');
                      },
                      text: option1,
                      options: FFButtonOptions(
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.height * 0.05,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: firstButtonColor,
                        textStyle: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: firstButtonColortext,
                          letterSpacing: 0,
                        ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      showLoadingIndicator: false,
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        setState(() {
                          firstButtonColor = Colors.white;
                          secondButtonColor = Color(0xFF4B39EF);
                          thirdButtonColor = Colors.white;
                          status = true;

                          firstButtonColortext = Color(0xFF4B39EF);
                          secondButtonColortext = Colors.white;
                          thirdButtonColortext = Color(0xFF4B39EF);

                          dataList.add(option1.trim());
                          dataList1.add(randomLetter3);
                          print(dataList);
                          print(dataList1);
                          if (screen == 1) {
                            dataList = [];
                            dataList1 = [];
                          }
                        });
                        print('Second button pressed ...');
                      },
                      text: randomLetter3,
                      options: FFButtonOptions(
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.height * 0.05,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: secondButtonColor,
                        textStyle: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: secondButtonColortext,
                          letterSpacing: 0,
                        ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      showLoadingIndicator: false,
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        setState(() {
                          firstButtonColor = Colors.white;
                          secondButtonColor = Colors.white;
                          thirdButtonColor = Color(0xFF4B39EF);
                          status = true;

                          secondButtonColortext = Color(0xFF4B39EF);
                          thirdButtonColortext = Colors.white;
                          firstButtonColortext = Color(0xFF4B39EF);

                          dataList.add(option1.trim());
                          dataList1.add(randomLetter2);
                          print(dataList);
                          print(dataList1);
                          if (screen == 1) {
                            dataList = [];
                            dataList1 = [];
                          }
                        });
                        print('Second button pressed ...');
                      },
                      text: randomLetter2,
                      options: FFButtonOptions(
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.height * 0.05,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: thirdButtonColor,
                        textStyle: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: thirdButtonColortext,
                          letterSpacing: 0,
                        ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      showLoadingIndicator: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (animationsMap['buttonOnActionTriggerAnimation'] !=
                        null) {
                      setState(() => hasButtonTriggered = true);

                      SchedulerBinding.instance!.addPostFrameCallback(
                          (_) async => await animationsMap[
                                  'buttonOnActionTriggerAnimation']!
                              .controller
                              .forward(from: 0.0));
                    }
                    setState(() {
                      if (status == true) {
                        if (screen < 10) {
                          screen++;
                          TransitionUtils.navigateWithAnimation(
                              context, SenellenQuizWidget(screen: screen));
                        } else {
                          TransitionUtils.navigateWithAnimation(context,
                              ReportWidget(data: dataList, data1: dataList1));
                        }
                      }
                    });
                  },
                  text: 'Proceed',
                  options: FFButtonOptions(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 44,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF4B39EF),
                    textStyle: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  showLoadingIndicator: false,
                ).animateOnActionTrigger(
                    animationsMap['buttonOnActionTriggerAnimation']!,
                    hasBeenTriggered: hasButtonTriggered),
              ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!),
            ],
          ),
        ),
      ),
    );
  }

  String number1_func(String option1, int random, int counter) {
    print(random);
    final random3 = Random();
    int randomIndex3 = random3
        .nextInt(26); // Generate a random number between 0 and 25 (inclusive)

    // Convert the random index to the corresponding ASCII value for a capital letter (65 for 'A', 90 for 'Z')
    int asciiCode3 = 65 + randomIndex3;

    // Use String.fromCharCode to convert the ASCII code to a character
    randomLetter3 = String.fromCharCode(asciiCode3);

    // More efficient approach using switch statement
    print(randomLetter3);

    if (random == 0) {
      print('hello1');
      status1 = true;
      resultList[counter];
      return option1;
    } else if (random == 1) {
      print('hello2');
      status1 = true;
      resultList[counter];
      return option1;
    } else if (random == 2) {
      print('hello3');
      status1 = true;
      resultList[counter];
      return option1;
    } else {
      resultList[counter];
      return randomLetter3;
    }
  }

  int num(int random) {
    if (status1 == false) {
      return random;
    } else {
      return 3;
    }
  }
}
