import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeqmother/Screens/AstigmentQuiz.dart';
import 'package:eyeqmother/Screens/Colorblind.dart';
import 'package:eyeqmother/Screens/Far_near.dart';
import 'package:eyeqmother/Screens/ReportExers.dart';
import 'package:eyeqmother/Screens/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../components/page_transmission.dart';
import '../resources/app_images.dart';
import '../userData.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TestList extends StatefulWidget {
  const TestList({super.key, required this.queryDoc, required this.chartName});
  final List<QueryDocumentSnapshot<Object?>> queryDoc;
  final String chartName;

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          child: SingleChildScrollView(
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
                     Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                        child: Column(
                          children: [
                            Text(
                              widget.chartName,
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 22,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
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
                            )
                          ],
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

                ListView.builder(
                  itemCount: widget.queryDoc.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                    Timestamp timeData = (widget.queryDoc[index].data() as Map<String, dynamic>)["timestamp"];
                    List<dynamic> list1 = (widget.queryDoc[index].data() as Map<String, dynamic>)["list1"];
                    List<dynamic> list2 = (widget.queryDoc[index].data() as Map<String, dynamic>)["list2"];
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
                        child: GestureDetector(
                          onTap: () async {
                            List<String> stringList1 = list1.map((e) => e.toString()).toList();
                            List<String> stringList2 = list2.map((e) => e.toString()).toList();

                            TransitionUtils.navigateWithAnimation1(context,
                                ReportWidget(data: stringList1, data1: stringList2, chartName: widget.chartName,));
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

                                   Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                          child: Text(
                                            'Test ${(index+1)}',
                                            style: const TextStyle(
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
                                             "${timeData.toDate().month.toMonthName()}, ${timeData.toDate().day} ${timeData.toDate().year} at ${timeData.toDate().hour}:${timeData.toDate().minute}",
                                            style: TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Colors.black,
                                              fontSize: 11,
                                              letterSpacing: 0,
                                              fontStyle: FontStyle.italic,
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
                      );
                    }
                ),

              ],
            ),
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


}
