import 'package:eyeqmother/Screens/AstigmentQuiz.dart';
import 'package:eyeqmother/Screens/Colorblind.dart';
import 'package:eyeqmother/Screens/Far_near.dart';
import 'package:eyeqmother/Screens/ReportExers.dart';
import 'package:eyeqmother/Screens/report_home.dart';
import 'package:eyeqmother/components/customDailogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/page_transmission.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '../resources/app_images.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'home_model.dart';
import 'login_widget.dart';
export 'home_model.dart';


late List<String> dataList = [];
late List<String> dataList1 = [];

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

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
    _model = createModel(context, () => HomeModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

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
                Stack(
                  children: [
                    ClipRRect(
                      //borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(10)),
                      child: Image.asset(
                        'assets/images/Rectangle.png',
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.28,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Home',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                          child: Column(
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
                              const Text(
                                'Hello there',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 15,
                                  letterSpacing: 0,
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                   'Start your test now',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 15,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        GestureDetector(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialogue(
                                  heading: 'Are you sure you want to logout?',
                                body: 'You will be redirected to the login screen',
                              ),
                            ).then((value){
                              if(value){
                                clearAllData();
                                TransitionUtils.navigateWithAnimation1(
                                    context,
                                    const LoginWidget());
                              }
                            });

                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            margin: EdgeInsets.all(8.0),
                            height: MediaQuery.sizeOf(context).height * 0.06,
                            width: MediaQuery.sizeOf(context).width * 0.18,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.transparent, // Set background color to transparent
                            ),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.white, // Set text color to white
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
                  child: GestureDetector(
                    onTap: () {
                      TransitionUtils.navigateWithAnimation1(
                          context, const FarNearWidget());
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
                        boxShadow: const [
                          BoxShadow(
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
                  child: GestureDetector(
                    onTap: () {
                      // Add the navigation logic here
                      dataList = [];
                      dataList1 = [];
                      TransitionUtils.navigateWithAnimation1(
                        context,
                        ColorblindWidget(
                          screen: 1,
                        ),
                      );
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
                        boxShadow: const [
                          BoxShadow(
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
                  child: GestureDetector(
                    onTap: () {
                      dataList1 = [];
                      dataList = [];
                      TransitionUtils.navigateWithAnimation1(
                          context,
                          const AstigquizWidget(
                            screen: 1,
                          ));
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
                        boxShadow: const [
                          BoxShadow(
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
                  child: GestureDetector(
                    onTap: () {
                      // Add the navigation logic here
                      TransitionUtils.navigateWithAnimation1(
                          context, const RecoveryExersWidget());
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
                        boxShadow: const [
                          BoxShadow(
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
                                      AppImages().RecoveryExercisesImage,
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
                                      'Recovery Exercises',
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
                                      'Content about Exercises...',
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 10),
                  child: GestureDetector(
                    onTap: () {
                      TransitionUtils.navigateWithAnimation1(
                          context, const homereport());
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
                        boxShadow: const [
                          BoxShadow(
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
                                      AppImages().ReportHistoryImage,
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
                                      'Report History',
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
                                      'Content about history...',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
