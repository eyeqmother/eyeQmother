import 'dart:math';

import 'package:eyeqmother/Screens/Colorblind.dart';
import 'package:eyeqmother/Screens/report.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:eyeqmother/Screens/report2.dart';

import '../components/page_transmission.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

class AstigquizWidget extends StatefulWidget {
  final int screen;

  const AstigquizWidget({super.key, required this.screen});
  @override
  State<AstigquizWidget> createState() => _AstigquizWidgetState();
}

class _AstigquizWidgetState extends State<AstigquizWidget>
    with TickerProviderStateMixin {
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

  Color firstButtonColor = Colors.black; // Initial color for the first button
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
      //  int asciiCode3 = 65 + randomIndex3;
      randomLetter3 = randomIndex3.toString();
      ;
      int randomNumber = random.nextInt(101);
      final random2 = Random();
      int randomIndex2 = random2.nextInt(26);
      // int asciiCode2 = 65 + randomIndex2;
      randomLetter2 = randomIndex2.toString();
    });
    status = false;

    setState(() {
      firstButtonColor = Colors.black;
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
  }

  @override
  void dispose() {
    animationsMap.values.forEach((animation) => animation.controller.dispose());
    super.dispose();
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
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Text(
                  'Astigmatism Test',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Text(
                        'Instructions',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          color: Colors.blue,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 0, 5, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Test each eye separately. \n\nCover the eye that you are not using.\n\nKeep the grid at a normal reading distance about 14 inches away.\n\n Look directly at the dot in the center of the grid.\n\nIf you normally wear glasses, do so while looking at the grid If you \nnotice blurry or wavy lines, and dark or blank spots, call your Retina\n Specialist immediately.',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 11,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/A${screen}.png',
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Text(
                  'Which shade you see?',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
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
                        borderRadius: BorderRadius.circular(50),
                      ),
                      showLoadingIndicator: false,
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        setState(() {
                          firstButtonColor = Colors.black;
                          secondButtonColor = Colors.white;
                          thirdButtonColor = Color(0xFF4B39EF);
                          status = true;

                          secondButtonColortext = Color(0xFF4B39EF);
                          thirdButtonColortext = Colors.white;
                          firstButtonColortext = Colors.black;
                        });
                        print('Second button pressed ...');
                      },
                      text: '',
                      options: FFButtonOptions(
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.height * 0.05,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: thirdButtonColor,
                        textStyle: TextStyle(
                          fontFamily: 'Readex Pro',
                          // color: thirdButtonColortext,
                          letterSpacing: 0,
                        ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(50),
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
                        if (screen < 4) {
                          screen++;
                          TransitionUtils.navigateWithAnimation(
                              context, AstigquizWidget(screen: screen));
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
}
