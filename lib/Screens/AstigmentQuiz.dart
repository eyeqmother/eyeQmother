import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quzzapp1/Screens/report2.dart';

import '../components/page_transmission.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

class AstigquizWidget extends StatefulWidget {
  const AstigquizWidget({super.key});

  @override
  State<AstigquizWidget> createState() => _AstigquizWidgetState();
}

class _AstigquizWidgetState extends State<AstigquizWidget>
    with TickerProviderStateMixin {
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
          begin: const Offset(0, 0),
          end: const Offset(0, 0),
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
          begin: const Offset(0.7, 1),
          end: const Offset(1, 1),
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
                    'assets/images/Astigbox.png',
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: MediaQuery.sizeOf(context).height * 0.3,
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: CircularPercentIndicator(
                  percent: 0.2,
                  radius: 20,
                  lineWidth: 4,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: const Color(0xFF4B39EF),
                  backgroundColor: const Color(0xFFE0E3E7),
                  center: const Text(
                    '20',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: Color(0xFF14181B),
                      fontSize: 12,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
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
                        context, const ReportWidget2());
                  },
                  text: 'Next',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 44,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: const Color(0xFF4B39EF),
                    textStyle: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
                    elevation: 3,
                    borderSide: const BorderSide(
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
