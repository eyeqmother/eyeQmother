import 'dart:math';

import 'package:flutter/scheduler.dart';
import 'package:quzzapp1/Screens/report.dart';

import '../components/page_transmission.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '../resources/app_images.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'colorchangedemo.dart';
import 'senellen_quiz_model.dart';
export 'senellen_quiz_model.dart';

class SenellenQuizWidget extends StatefulWidget {
  const SenellenQuizWidget({super.key});

  @override
  State<SenellenQuizWidget> createState() => _SenellenQuizWidgetState();
}

class _SenellenQuizWidgetState extends State<SenellenQuizWidget>
    with TickerProviderStateMixin {
  late SenellenQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasButtonTriggered = false;
  final animationsMap = {
    'progressBarOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-50, 0),
          end: Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.7, 0.7),
          end: Offset(1, 1),
        ),
      ],
    ),
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SenellenQuizModel());

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
    _model.dispose();

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              // Center(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: List.generate(
              //       _textInfoList.length,
              //       (row) => Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: List.generate(
              //           _textInfoList[row].length,
              //           (col) => Padding(
              //             padding: EdgeInsets.symmetric(vertical: 3.0),
              //             child: Text(
              //               _textInfoList[row][col].text,
              //               style: TextStyle(
              //                 fontSize: _textInfoList[row][col].fontSize,
              //                 color: _textInfoList[row][col].color,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

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
                              height: MediaQuery.sizeOf(context).height * 0.005,
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              height: MediaQuery.sizeOf(context).height * 0.01,
                              decoration: BoxDecoration(
                                color: Color(0xFFFD0000),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.01,
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
                              height: MediaQuery.sizeOf(context).height * 0.01,
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              height: MediaQuery.sizeOf(context).height * 0.01,
                              decoration: BoxDecoration(
                                color: Color(0xFF4AB40E),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.005,
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

              //ColorChangeDemo(),
              // Align(
              //   alignment: AlignmentDirectional(0, -1),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(8),
              //     child: Image.asset(
              //       AppImages().sentelQuiz1,
              //       width: MediaQuery.sizeOf(context).width * 0.65,
              //       height: MediaQuery.sizeOf(context).height * 0.6,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CircularPercentIndicator(
                percent: 0.2,
                radius: 20,
                lineWidth: 4,
                animation: true,
                animateFromLastPercent: true,
                progressColor: Color(0xFF4B39EF),
                backgroundColor: Color(0xFFE0E3E7),
                center: Text(
                  '20',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0xFF14181B),
                    fontSize: 14,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['progressBarOnPageLoadAnimation']!),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Text(
                  'What is the circled alphabet?',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (animationsMap['buttonOnActionTriggerAnimation'] !=
                        null) {
                      setState(() => hasButtonTriggered = true);

                      SchedulerBinding.instance.addPostFrameCallback(
                          (_) async => await animationsMap[
                                  'buttonOnActionTriggerAnimation']!
                              .controller
                              .forward(from: 0.0));
                    }

                    TransitionUtils.navigateWithAnimation(
                        context, const ReportWidget());
                  },
                  text: 'Proceed',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.75,
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
