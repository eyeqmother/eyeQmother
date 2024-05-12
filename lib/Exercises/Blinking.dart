import 'package:flutter/material.dart';
import 'package:eyeqmother/resources/app_images.dart';

class Blinking extends StatefulWidget {
  @override
  State<Blinking> createState() => _BlinkingState();
}

class _BlinkingState extends State<Blinking> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Rectangle.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Container(
                            width: 60,
                            height: 60,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/image2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Exercises 5',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(
                            'Do these ten exercises \n regularly to improve your eyesight',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Blinking Exercise',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              // Generated code for this Row Widget...
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: MediaQuery.sizeOf(context).height * 1,
                    decoration: BoxDecoration(
                        // color: FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            '1). Sit comfortably: Find a comfortable chair and sit with your back straight.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Text(
                            '2). Relax: Close your eyes gently.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            '3). Breathe: Take a deep breath in through your nose, and exhale slowly through your mouth.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            '4). Open your eyes: Slowly open your eyes, but do not stare.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Text(
                            '5). Blink: Blink your eyes gently 10 times.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Text(
                            '6). Close your eyes: Close your eyes gently again.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            '7). Repeat: Repeat this process for 3-5 times, or as needed.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
