import 'package:quzzapp1/Screens/report.dart';
import 'package:quzzapp1/Screens/report1.dart';
import 'package:quzzapp1/resources/app_images.dart';

import '../components/page_transmission.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:percent_indicator/percent_indicator.dart';

class ColorblindWidget extends StatefulWidget {
  const ColorblindWidget({super.key});

  @override
  State<ColorblindWidget> createState() => _ColorblindWidgetState();
}

class _ColorblindWidgetState extends State<ColorblindWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasButtonTriggered = false;

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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Text(
                  'Color Bindness Test',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Text(
                  'What number do you see?',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppImages().Color_bliendness1,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: MediaQuery.sizeOf(context).height * 0.45,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
              CircularPercentIndicator(
                percent: 0.2,
                radius: 25,
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
                        context, const ReportWidget1());
                  },
                  text: 'Next',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.7,
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
