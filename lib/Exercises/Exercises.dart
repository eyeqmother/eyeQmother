import 'package:flutter/material.dart';
import 'package:eyeqmother/resources/app_images.dart';

class ExersizeWidget11 extends StatefulWidget {
  @override
  State<ExersizeWidget11> createState() => _ExersizeWidget11State();
}

class _ExersizeWidget11State extends State<ExersizeWidget11> {
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
                            'Exercises 1',
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
                      'Palming:',
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
                            '1). Find a comfortable seated position: Sit in a comfortable chair with your feet flat on the floor and your back straight',
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
                            ' 2). Warm your hands: Rub your palms together vigorously for about 15-20 seconds to generate heat. This will help soothe your eyes.',
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
                            '3). Cup your hands: Once your palms are warm, cup them gently over your closed eyes without applying pressure. Your fingers should overlap on your forehead, and your hands should be relaxed.',
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
                            '4). Create a seal: Ensure that no light enters your eyes by pressing the heels of your hands gently into your eye sockets, creating a seal.',
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
                            '5).Relax and breathe: Take a few deep breaths and concentrate on relaxing the muscles around your eyes.',
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
                            '6).Visualize darkness: Try to visualize a field of pure blackness or darkness.',
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
