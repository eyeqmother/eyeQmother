import 'package:flutter/material.dart';
import 'package:eyeqmother/resources/app_images.dart';

class rule20 extends StatefulWidget {
  @override
  State<rule20> createState() => _rule20State();
}

class _rule20State extends State<rule20> {
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
                            'Exercises 3',
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
                      'rule20',
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
                            '1.	Set a Timer: Use a timer or a reminder on your computer or smartphone.',
                            //'1). Sit comfortably: Sit in a comfortable position with your back straight and your shoulders relaxed.',
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
                            '2.	Every 20 Minutes: Take a break from looking at your screen every 20 minutes.',
                            //' 2.	Focus on your thumb: Focus your eyes on your thumb and make sure its clear and sharp.',
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
                            '3.	Look at Something 20 Feet Away: Look away from your screen and focus on something at least 20 feet away from you.',
                            //'Start rule20: Slowly bring your thumb closer to your nose while keeping it in focus. Continue to focus on your thumb as it gets closer.',
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
                            //'Hold for a moment: Hold your thumb at the closest point where you can still keep it in focus.',
                            '4.	For 20 Seconds: Keep your eyes focused on the object at a distance for at least 20 seconds.',
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
                            '5.	Blink: While looking at the distant object, blink your eyes several times. This helps to keep your eyes moist and reduces dryness.',
                            //'Zoom out: Slowly move your thumb back to arms length while keeping it in focus.',
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
                            '6.	Stretch: If possible, take this time to stand up, stretch your body, and change your posture.',
                            //'6).Repeat: Repeat this process several times, focusing on keeping your thumb clear and sharp as you zoom in and out.',
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
