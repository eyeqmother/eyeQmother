import 'package:eyeqmother/resources/app_images.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'instructionTile.dart';

class BlinkingExercise extends StatefulWidget {
  const BlinkingExercise({super.key});

  @override
  State<BlinkingExercise> createState() => _BlinkingExerciseState();
}

class _BlinkingExerciseState extends State<BlinkingExercise> {
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
                                ' Exercises 5',
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
                          description: 'Find a comfortable chair and sit with your back straight.',
                        ),
                        InstructionTile(
                          title: 'Relax',
                          description: 'Close your eyes gently.',
                        ),
                        InstructionTile(
                          title: 'Breathe',
                          description: 'Take a deep breath in through your nose, and exhale slowly through your mouth.',
                        ),
                        InstructionTile(
                          title: 'Open Your Eyes',
                          description: 'Slowly open your eyes, but do not stare.',
                        ),
                        InstructionTile(
                          title: 'Blink',
                          description: 'Blink your eyes gently 10 times.',
                        ),
                        InstructionTile(
                          title: 'Close Your Eyes',
                          description: 'Close your eyes gently again.',
                        ),
                        InstructionTile(
                          title: 'Repeat',
                          description: 'Repeat this process for 3-5 times, or as needed.',
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Tips:',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Regular intervals: You can do this exercise several times a day, especially if you spend a lot of time looking at a screen.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Take breaks: It\'s good to take breaks from staring at screens. Every 20 minutes, look at something 20 feet away for at least 20 seconds.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Stay hydrated: Drink plenty of water to keep your eyes hydrated.',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'This exercise helps to relax your eye muscles and reduce eye strain.',
                          style: TextStyle(fontSize: 16.0),
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
