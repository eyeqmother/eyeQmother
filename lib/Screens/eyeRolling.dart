import 'package:eyeqmother/resources/app_images.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'instructionTile.dart';

class EyeRolling extends StatefulWidget {
  const EyeRolling({super.key});

  @override
  State<EyeRolling> createState() => _EyeRollingState();
}

class _EyeRollingState extends State<EyeRolling> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/Rectangle.png',
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.35,
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
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Text(
                                ' Exercises 4',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                'Do these ten exercises regularly to improve \nyour eye sight',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 13,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
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
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InstructionTile(
                          title: 'Sit Comfortably',
                          description: 'Find a comfortable chair and sit up straight with your shoulders relaxed.',
                        ),
                        InstructionTile(
                          title: 'Take a Deep Breath',
                          description: 'Inhale deeply through your nose, and exhale slowly through your mouth. Relax your facial muscles as you do this.',
                        ),
                        InstructionTile(
                          title: 'Roll Your Eyes Slowly',
                          description: 'Start by looking straight ahead. Then, without moving your head, slowly look up towards the ceiling. Hold this position for a few seconds.',
                        ),
                        InstructionTile(
                          title: 'Continue Rolling',
                          description: 'Now, slowly roll your eyes to the right, so you\'re looking towards your right shoulder. Hold for a few seconds.',
                        ),
                        InstructionTile(
                          title: 'Roll Down',
                          description: 'Next, roll your eyes down, so you\'re looking towards the floor. Hold for a few seconds.',
                        ),
                        InstructionTile(
                          title: 'Roll to the Left',
                          description: 'Finally, roll your eyes to the left, so you\'re looking towards your left shoulder. Hold for a few seconds.',
                        ),
                        InstructionTile(
                          title: 'Repeat',
                          description: 'Repeat this sequence a few times, always moving your eyes slowly and smoothly.',
                        ),
                        InstructionTile(
                          title: 'Reverse the Direction',
                          description: 'After you\'ve done a few rounds in one direction, reverse the direction. Start by looking up, then to the left, down, and finally to the right.',
                        ),
                        InstructionTile(
                          title: 'Rest',
                          description: 'After you\'ve completed several repetitions in both directions, close your eyes and take a few deep breaths to relax your eye muscles.',
                        ),
                      ],
                    ),
                  ),




                Center(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 20),
                    child: FFButtonWidget(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'Back',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: 40,
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: const Color(0xFF4B39EF),
                        textStyle: const TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0,
                        ),
                        elevation: 3,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
