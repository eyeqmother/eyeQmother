import 'package:eyeqmother/Screens/Colorblind.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/page_transmission.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../userData.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'ReportExers.dart';
import 'report_model.dart';
export 'report_model.dart';

class ReportWidget extends StatefulWidget {
  final List<String> data;
  final List<String> data1;
  final String chartName;

  ReportWidget({required this.data, required this.data1, required this.chartName});

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasButtonTriggered = false;
  List<String> matchResult = [];
  List<Color> colorResult = [];
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
  late int scorePercentage;
  int matchingCount = 0;
  @override
  void initState() {
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
    print("hello");
    //  print(widget.data1);
    // print(widget.data);
    matchingCount = 0;
    scorePercentage = calculateScore(widget.data, widget.data1);
    calculateMatchingCount();
  }

  int calculateScore(List<String> correctAnswers, List<String> selectedAnswers) {
    if (correctAnswers.length != selectedAnswers.length) {
      throw Exception("The lists of answers must be of the same length.");
    }

    int correctCount = 0;

    // Count correct answers
    for (int i = 0; i < correctAnswers.length; i++) {
      if (correctAnswers[i].toUpperCase() == selectedAnswers[i].toUpperCase()) {
        correctCount++;
      }
    }

    // Calculate percentage
    int percentage = ((correctCount / correctAnswers.length) * 100).round();
    print(correctCount);
    print(correctAnswers.length);
    print(percentage);
    return percentage;
  }

  void calculateMatchingCount() {
    matchResult.clear();
    colorResult.clear();

    // print(widget.data1.length);
    print(widget.data[0]);

    if (widget.data.length == widget.data1.length) {
      for (int i = 0; i < widget.data.length; i++) {
        print(i);
        if (widget.data1[i] == widget.data[i]) {
          matchResult.add(widget.data1[i]); // "C" for match
          colorResult.add(Colors.green);
          matchingCount++;
        } else {
          matchResult.add(widget.data1[i]); // "W" for mismatch
          colorResult.add(Colors.red);
        }
      }
    } else {
      print("Lists have different lengths.");
      // Handle case where lists have different lengths
    }

    // Print or debug here to verify the contents of matchResult and colorResult
    print("matchResult: $matchResult");
    print("colorResult: $colorResult");

    setState(() {}); // Update the widget state
  }

  @override
  void dispose() {
    dataList = [];
    dataList1 = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/Rectangle.png',
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: Container(
                              width: 60,
                              height: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/applogo.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 20,
                                letterSpacing: 0,
                                color: Colors.white,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Name: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: userName,

                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                            child: Text(
                              'Results of ${widget.chartName}',
                              style: const TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: double.infinity,//MediaQuery.sizeOf(context).height * 0.6,
                    decoration: BoxDecoration(
                      //color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/containerQuiZ.png',
                        ).image,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              'Score of tests',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              'Result  ${scorePercentage} % efficiency',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width *
                                0.5, // Adjust the height asded
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: widget.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: 100, // Adjust the width as needed
                                  margin: EdgeInsets.all(8),

                                  child: buildMessageWidget(
                                      context,
                                      colorResult[index],
                                      matchResult[index],
                                      widget.data1[index],
                                      widget.data[index]),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              'Comments from app',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: MediaQuery.sizeOf(context).height * 0.11,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Text(
                                scorePercentage > 60 ? 'Your score is optimal, keep performing exercises and drink plenty of water daily with moderate intake of fruits.' : 'According to your tests results you need\nto consult with related doctor.Click the\nbutton below to find nearest doctor.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ),
                          if (scorePercentage > 60) ...{
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 20),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (animationsMap[
                                          'buttonOnActionTriggerAnimation'] !=
                                      null) {
                                    setState(() => hasButtonTriggered = true);

                                    SchedulerBinding.instance.addPostFrameCallback(
                                        (_) async => await animationsMap[
                                                'buttonOnActionTriggerAnimation']!
                                            .controller
                                            .forward(from: 0.0));
                                  }

                                  TransitionUtils.navigateWithAnimation1(
                                      context, const RecoveryExersWidget());
                                },
                                text: 'Exercises',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 0.7,
                                  height: 44,
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  iconPadding:
                                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                            ).animateOnPageLoad(
                                animationsMap['buttonOnPageLoadAnimation']!),
                          } else ...{
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 20),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (animationsMap[
                                          'buttonOnActionTriggerAnimation'] !=
                                      null) {
                                    setState(() => hasButtonTriggered = true);

                                    SchedulerBinding.instance.addPostFrameCallback(
                                        (_) async => await animationsMap[
                                                'buttonOnActionTriggerAnimation']!
                                            .controller
                                            .forward(from: 0.0));
                                  }
                                  _launchURLBrowser();
                                  // TransitionUtils.navigateWithAnimation(
                                  //     context, const HomeWidget());
                                },
                                text: 'Doctor Nearby',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 0.7,
                                  height: 44,
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  iconPadding:
                                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                            ).animateOnPageLoad(
                                animationsMap['buttonOnPageLoadAnimation']!),
                          }
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURLBrowser() async {
    var url =
        Uri.parse("https://www.google.com/maps/search/eye+specialists+near+me");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
