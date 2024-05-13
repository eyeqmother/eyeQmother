import 'package:eyeqmother/resources/app_images.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'instructionTile.dart';

class SidewayView extends StatefulWidget {
  const SidewayView({super.key});

  @override
  State<SidewayView> createState() => _SidewayViewState();
}

class _SidewayViewState extends State<SidewayView> {
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
                                  'assets/images/applogo.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Text(
                                ' Exercises 7',
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

                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InstructionTile(
                          title: 'Sit or Stand Comfortably',
                          description:
                          'Make sure you are in a relaxed position with your head facing forward.',
                        ),
                        InstructionTile(
                          title: 'Focus Straight Ahead',
                          description:
                          'Choose a specific point directly in front of you to focus on.',
                        ),
                        InstructionTile(
                          title: 'Look to the Right',
                          description:
                          'Without moving your head, look as far as you can to the right. Try to see as far as you can without straining. Hold this position for a few seconds.',
                        ),
                        InstructionTile(
                          title: 'Return to Center',
                          description: 'Slowly bring your gaze back to the center. Take a moment to relax your eyes.',
                        ),
                        InstructionTile(
                          title: 'Look to the Left',
                          description:
                          'Now, look as far as you can to the left. Again, hold this position for a few seconds.',
                        ),
                        InstructionTile(
                          title: 'Return to Center',
                          description: 'Bring your gaze back to the center. Take a moment to relax.',
                        ),
                        InstructionTile(
                          title: 'Repeat and Increase Range',
                          description:
                          'Repeat this process several times. Try to increase the range of your sideways vision each time.',
                        ),
                        InstructionTile(
                          title: 'Do this Exercise Regularly',
                          description: 'Incorporate it into your daily routine for best results.',
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


