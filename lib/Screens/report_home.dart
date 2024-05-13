import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeqmother/Screens/AstigmentQuiz.dart';
import 'package:eyeqmother/Screens/Colorblind.dart';
import 'package:eyeqmother/Screens/Far_near.dart';
import 'package:eyeqmother/Screens/ReportExers.dart';
import 'package:eyeqmother/Screens/report.dart';
import 'package:eyeqmother/Screens/test_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../components/page_transmission.dart';
import '../resources/app_images.dart';
import '../userData.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class homereport extends StatefulWidget {
  const homereport({super.key});

  @override
  State<homereport> createState() => _homereportState();
}

class _homereportState extends State<homereport> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = false;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(100, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
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
              // Generated code for this Stack Widget...
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Rectangle.png',
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                      child: Text(
                        'Reports',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
                child: Text(
                  'Select Test',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 22,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Visibility(
                visible: loading,
                  child: CircularProgressIndicator()
              ),
              Visibility(
                visible: !loading,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
                  child: GestureDetector(
                    onTap: () async {
                      loading = true;
                      setState(() {});
                      fetchLatestSnellenChartData().then((docs)
                      {
                        print("Data:");

                        List<QueryDocumentSnapshot<Object?>> dynamicData = docs;
                        loading = false;
                        setState(() {});
                        TransitionUtils.navigateWithAnimation1(
                            context, TestList(
                          queryDoc: dynamicData,
                          chartName: "Snellen Chart",
                        ));

                        for (var doc in docs) {
                          print(doc.data());  // Output the data of each document
                        }
                      }).catchError((error)
                      {
                        loading = false;
                        setState(() {});
                        print("Failed to fetch data: $error");
                      });

                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            AppImages().Container_color,
                          ).image,
                        ),
                        boxShadow: [
                          const BoxShadow(
                            blurRadius: 0,
                            color: Color(0xFFE0E3E7),
                            offset: Offset(
                              0.0,
                              1,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: MediaQuery.sizeOf(context).width * 0.2,
                                decoration: BoxDecoration(
                                  color: const Color(0x4C4B39EF),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF4B39EF),
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/Senllen.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                    child: Text(
                                      'Snellen chart',
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF10181B),
                                        fontSize: 15,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(12, 4, 0, 0),
                                    child: Text(
                                      'Content about test...',
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 10,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: const Color(0xFF4B39EF),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
                ),
              ),
              Visibility(
                visible: !loading,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
                  child: GestureDetector(
                    onTap: () async {
                      loading = true;
                      setState(() {});
                      fetchLatestColorBlindnessData().then((docs) {
                        print("Data:");

                        List<QueryDocumentSnapshot<Object?>> dynamicData = docs;
                        loading = false;
                        setState(() {});
                        TransitionUtils.navigateWithAnimation1(
                            context, TestList(
                          queryDoc: dynamicData,
                          chartName: "Color Blindness",
                        ));
                        for (var doc in docs) {
                          print(doc.data());  // Output the data of each document
                        }
                      }).catchError((error) {
                        loading = false;
                        setState(() {});
                        print("Failed to fetch data: $error");
                      });

                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            AppImages().Container_color,
                          ).image,
                        ),
                        boxShadow: [
                          const BoxShadow(
                            blurRadius: 0,
                            color: Color(0xFFE0E3E7),
                            offset: Offset(
                              0.0,
                              1,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: MediaQuery.sizeOf(context).width * 0.2,
                                decoration: BoxDecoration(
                                  color: const Color(0x4C4B39EF),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF4B39EF),
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      AppImages().Color_bliendness,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                    child: Text(
                                      'Color Blindness',
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF10181B),
                                        fontSize: 15,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(12, 4, 0, 0),
                                    child: Text(
                                      'Content about test...',
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 10,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: const Color(0xFF4B39EF),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
                ),
              ),
              Visibility(
                visible: !loading,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
                  child: GestureDetector(
                    onTap: () async {
                      loading = true;
                      setState(() {});
                      fetchLatestAstigmatismData().then((docs) {
                        print("Data:");

                        List<QueryDocumentSnapshot<Object?>> dynamicData = docs;
                        loading = false;
                        setState(() {});
                        TransitionUtils.navigateWithAnimation1(
                            context, TestList(
                          queryDoc: dynamicData,
                          chartName: "Astigmatism",
                        ));
                        for (var doc in docs) {
                          print(doc.data());  // Output the data of each document
                        }
                      }).catchError((error) {
                        loading = false;
                        setState(() {});
                        print("Failed to fetch data: $error");
                      });

                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            AppImages().Container_color,
                          ).image,
                        ),
                        boxShadow: [
                          const BoxShadow(
                            blurRadius: 0,
                            color: Color(0xFFE0E3E7),
                            offset: Offset(
                              0.0,
                              1,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height: MediaQuery.sizeOf(context).width * 0.2,
                                decoration: BoxDecoration(
                                  color: const Color(0x4C4B39EF),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF4B39EF),
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      AppImages().AstigmatismImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                    child: Text(
                                      'Astigmatism',
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF10181B),
                                        fontSize: 15,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(12, 4, 0, 0),
                                    child: Text(
                                      'Content about test...',
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 10,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: const Color(0xFF4B39EF),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<QueryDocumentSnapshot>> fetchLatestSnellenChartData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('test');
    DocumentReference userDoc = users.doc(userEmail);
    CollectionReference snellenChartCollection = userDoc.collection('Snellen Chart');

    // Query to fetch documents sorted by timestamp in descending order
    QuerySnapshot snapshot = await snellenChartCollection
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs;
  }
  Future<List<QueryDocumentSnapshot>> fetchLatestColorBlindnessData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('test');
    DocumentReference userDoc = users.doc(userEmail);
    CollectionReference snellenChartCollection = userDoc.collection('Color Blindness');

    // Query to fetch documents sorted by timestamp in descending order
    QuerySnapshot snapshot = await snellenChartCollection
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs;
  }
  Future<List<QueryDocumentSnapshot>> fetchLatestAstigmatismData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('test');
    DocumentReference userDoc = users.doc(userEmail);
    CollectionReference snellenChartCollection = userDoc.collection('Astigmatism');

    // Query to fetch documents sorted by timestamp in descending order
    QuerySnapshot snapshot = await snellenChartCollection
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs;
  }


}
