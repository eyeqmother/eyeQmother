import 'package:eyeqmother/resources/app_images.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'instructionTile.dart';

class DIYeyeMassagae extends StatefulWidget {
  const DIYeyeMassagae({super.key});

  @override
  State<DIYeyeMassagae> createState() => _DIYeyeMassagaeState();
}

class _DIYeyeMassagaeState extends State<DIYeyeMassagae> {
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
                                ' Exercises 9',
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
                          title: '1. Warm-Up',
                          description: 'Rub your hands together vigorously until they feel warm. Cup your hands over your closed eyes without applying pressure. Enjoy the warmth for about 30 seconds.',
                        ),
                        InstructionTile(
                          title: '2. Palming',
                          description: 'Sit comfortably and close your eyes. Place your palms over your eyes, with your fingers resting on your forehead. Make sure there is no pressure on your eyeballs. Breathe deeply and relax for 1-2 minutes.',
                        ),
                        InstructionTile(
                          title: '3. Blinking',
                          description: 'Open your eyes and blink rapidly for about 20 seconds. Then, close your eyes and relax for 20 seconds. Repeat this 5 times.',
                        ),
                        InstructionTile(
                          title: '4. Eye Massage',
                          description: 'With your eyes closed, use your index and middle fingers to gently massage your eyelids in a circular motion. Start from the inner corner and move outwards. Do this for about 30 seconds.',
                        ),
                        InstructionTile(
                          title: '5. Temple Massage',
                          description: 'Use your fingertips to massage your temples in a circular motion for about 20 seconds.',
                        ),
                        InstructionTile(
                          title: '6. Forehead Massage',
                          description: 'With your fingertips, massage your forehead in a circular motion, moving from the center outwards. Focus on the area just above your eyebrows. Continue for about 20 seconds.',
                        ),
                        InstructionTile(
                          title: '7. Repeat',
                          description: 'Repeat the entire process if desired, focusing on any areas that feel particularly tense.',
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Note:',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'If you feel any discomfort or pain during the massage, stop immediately. It\'s essential to be gentle with your eyes and the surrounding area. If you\'re experiencing persistent eye problems, it\'s best to consult with an eye care professional.',
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
