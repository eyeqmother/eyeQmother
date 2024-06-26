import 'package:eyeqmother/Screens/Colorblind.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'report_model.dart';
export 'report_model.dart';

class report1 extends StatefulWidget {
  List<dynamic> data;
  List<dynamic> data1;

  report1({required this.data, required this.data1});

  @override
  State<report1> createState() => _report1State();
}

class _report1State extends State<report1> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasButtonTriggered = false;
  List<String> matchResult = [];
  List<String> corrincorr = [];
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

    print(widget.data);
    print(widget.data1);

    matchingCount = 0;
    calculateMatchingCount();
    storeString("hello");
  }

// Function to store a string in Firebase Realtime Database
  void storeString(String stringValue) {
    try {
      // Obtain the user's UID
      DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

// Access a child of the current reference
      DatabaseReference child = ref.child("name");

      print(ref.key); // "123"
      print(ref.parent!.key); // "users"
    } catch (e) {
      print('Error signing up: $e');
    }
  }

  void calculateMatchingCount() {
    matchResult.clear();
    colorResult.clear();

    // print(widget.data1.length);

    if (widget.data.length >= 10 && widget.data1.length >= 10) {
      // last10Data = widget.data.sublist(widget.data.length - 10);
      // last10Data1 = widget.data1.sublist(widget.data1.length - 10);

      for (int i = 0; i < widget.data.length; i++) {
        if (widget.data[i] == widget.data1[i]) {
          matchResult.add("C"); // "C" for match
          colorResult.add(Colors.green);
          corrincorr.add("correct");
          matchingCount++;
        } else {
          matchResult.add("W"); // "W" for mismatch
          colorResult.add(Colors.red);
          corrincorr.add("incorrect");
        }
      }
    } else {
      print("Lists do not have at least 10 elements.");
      // Handle case where lists do not have at least 10 elements
    }

    // Print or debug here to verify the contents of matchResult and colorResult
    print("matchResult: $matchResult");
    //print("colorResult: $colorResult");

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Rectangle.png',
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      fit: BoxFit.cover,
                    ),
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
                                'assets/images/image2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                            child: Text(
                              'Results of Chart',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.735,
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
                      // Padding(
                      //   padding:
                      //       const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      //   child: Text(
                      //     'Result  ${matchingCount}0 % efficiency',
                      //     style: TextStyle(
                      //       fontFamily: 'Readex Pro',
                      //       letterSpacing: 0,
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   height: MediaQuery.of(context).size.width *
                      //       0.65, // Adjust the height asded
                      //   child: ListView.builder(
                      //     scrollDirection: Axis.vertical,
                      //     itemCount: widget.data.length,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Container(
                      //         width: 100, // Adjust the width as needed
                      //         margin: EdgeInsets.all(8),

                      //         child: buildMessageWidget(
                      //           context,
                      //           colorResult[index],
                      //           matchResult[index],
                      //           widget.data[index],
                      //           widget.data1[index],
                      //           corrincorr[index],
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      if (widget.data[0] == 'Grey') ...{
                        buildMessageWidget2(
                          context,
                          Colors.green,
                          "C",
                          widget.data[0],
                          widget.data1[0],
                          'Correct',
                        ),
                      } else ...{
                        buildMessageWidget2(
                          context,
                          Colors.red,
                          "W",
                          widget.data[0],
                          widget.data1[0],
                          'incorrect',
                        ),
                      },

                      if (widget.data[1] == 'white') ...{
                        buildMessageWidget2(
                          context,
                          Colors.green,
                          "C",
                          widget.data[1],
                          widget.data1[1],
                          'Correct',
                        ),
                      } else ...{
                        buildMessageWidget2(
                          context,
                          Colors.red,
                          "W",
                          widget.data[1],
                          widget.data1[1],
                          'incorrect',
                        ),
                      },

                      if (widget.data[2] == 'Yes') ...{
                        buildMessageWidget2(
                          context,
                          Colors.green,
                          "C",
                          widget.data[2],
                          widget.data1[2],
                          'Correct',
                        ),
                      } else ...{
                        buildMessageWidget2(
                          context,
                          Colors.red,
                          "W",
                          widget.data[2],
                          widget.data1[2],
                          'incorrect',
                        ),
                      },

                      if (widget.data[3] == 'Yes') ...{
                        buildMessageWidget2(
                          context,
                          Colors.green,
                          "C",
                          widget.data[3],
                          widget.data1[3],
                          'Correct',
                        ),
                      } else ...{
                        buildMessageWidget2(
                          context,
                          Colors.red,
                          "W",
                          widget.data[3],
                          widget.data1[3],
                          'incorrect',
                        ),
                      },

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
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'According to your tests results you need\nto consult with related doctor.Click the\nbutton below to find nearest doctor.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (matchingCount > 4) ...{
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
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

                              // TransitionUtils.navigateWithAnimation(
                              //     context, const HomeWidget());
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
                              const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
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
