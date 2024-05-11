import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeqmother/Screens/Colorblind.dart';
import 'package:eyeqmother/Screens/report.dart';
import 'package:eyeqmother/userData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:eyeqmother/Screens/report2.dart';

import '../components/page_transmission.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

import 'Home.dart';

class AstigquizWidget extends StatefulWidget {
  final int screen;

  const AstigquizWidget({super.key, required this.screen});
  @override
  State<AstigquizWidget> createState() => _AstigquizWidgetState();
}

class _AstigquizWidgetState extends State<AstigquizWidget>
    with TickerProviderStateMixin {
  var hasButtonTriggered = false;
  String selectedValue = "";

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

  Color firstButtonColor = const Color(0xff5C5C5C); // Initial color for the first button
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


      dataList = [
        "0","0","0","1"
      ];

      screen = widget.screen;
      normalizedScreen = screen / 4;
      final random3 = Random();
      int randomIndex3 = random3.nextInt(26);
      //  int asciiCode3 = 65 + randomIndex3;
      randomLetter3 = randomIndex3.toString();

      int randomNumber = random.nextInt(101);
      final random2 = Random();
      int randomIndex2 = random2.nextInt(26);
      // int asciiCode2 = 65 + randomIndex2;
      randomLetter2 = randomIndex2.toString();

    });
    status = false;

    setState(() {
      firstButtonColor = const Color(0xff5C5C5C);
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
          child: SingleChildScrollView(
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
                 Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25, 0, 5, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            screen == 1 ? 'Test each eye separately. \n\nCover the eye that you are not using.\n\nKeep the grid at a normal reading distance about 14 inches away.\n\n Look directly at the dot in the center of the grid.\n\nIf you normally wear glasses, do so while looking at the grid If you \nnotice blurry or wavy lines, and dark or blank spots, call your Retina\n Specialist immediately.' :  screen == 2 ? 'Test each eye separately. \n\nCover the eye that you are not using.\n\nKeep the circle at a normal reading distance about 14\ninches away or at your elbow lenght.\n\nLook directly at the center of the circle.\n\nNow select the color of the lines you see, if it is light\ngreyish you may have astigmatism and consult with\ndoctor.' : screen == 3 ?"If all the lines are not uniform and\n some lines look bold or blurry, \nyou may have astigmatism" :  screen == 4 ? "If Pikachu is greeting you, you may suspect astigmatism." : "",
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
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Text(
                    'Can you see?',
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
                            thirdButtonColor = Colors.transparent;
                            status = true;
                            secondButtonColortext = Color(0xFF4B39EF);
                            firstButtonColortext = Colors.white;
                            thirdButtonColortext = Color(0xFF4B39EF);
                            selectedValue = "0";
                          });
                          print('First button pressed ...');
                        },
                        text: screen>=3 ? "Yes" : "",
                        options: FFButtonOptions(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: firstButtonColor,
                          textStyle: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
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
                      GestureDetector(
                        onTap: (){
                          firstButtonColor = const Color(0xff5C5C5C);
                          secondButtonColor = Colors.white;
                          thirdButtonColor = Color(0xFF4B39EF);
                          status = true;

                          secondButtonColortext = Color(0xFF4B39EF);
                          thirdButtonColortext = Colors.white;
                          firstButtonColortext = const Color(0xff5C5C5C);
                          selectedValue = "1";
                          setState(() {

                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.05,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  thirdButtonColor == Color(0xFF4B39EF) ? thirdButtonColor : Colors.white,
                                  thirdButtonColor == const Color(0xFF4B39EF) ? thirdButtonColor : Color(0xFFA7A7A7).withOpacity(0.3),
                                  thirdButtonColor == const Color(0xFF4B39EF) ? thirdButtonColor : Color(0xFFA1A0A0).withOpacity(0.3),
                                  thirdButtonColor == Color(0xFF4B39EF) ? thirdButtonColor : Color(0xFFBEA9A9).withOpacity(0.3)



                                  // Color(0xFF4B39EF),
                                ]
                            ),

                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            screen>=3 ? "No" : "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0,
                            ),
                          ),

                        ),
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
                      setState(() async {
                        if (status == true) {
                          dataList1.add(selectedValue);
                          print(dataList1);
                          print(dataList);
                          if (screen < 4) {
                            screen++;
                            TransitionUtils.navigateWithAnimation(
                                context, AstigquizWidget(screen: screen));
                          } else {
                            await updateAstigatismData(userEmail, dataList, dataList1);
                            TransitionUtils.navigateWithAnimation(context,
                                ReportWidget(data: dataList, data1: dataList1, chartName: 'Astigmatism',));
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
      ),
    );
  }

  Future<void> updateAstigatismData(String email, List<String> list1, List<String> list2) async {
    // Reference to Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Query to find the user document by email
      var querySnapshot = await firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        print('No user found with that email');
        return;
      }

      // Assuming email is unique and there's only one document
      DocumentReference userDocRef = querySnapshot.docs.first.reference;

      // Data to update
      Map<String, dynamic> dataToUpdate = {
        'Astigmatism': {
          'list1': list1,
          'list2': list2,
        },
      };

      // Update the document
      await userDocRef.update(dataToUpdate);
      print('Color Blindness data updated successfully!');
    } catch (e) {
      print('Error updating Color Blindness data: $e');
    }
  }

}
