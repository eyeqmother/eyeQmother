// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../flutter_flow/flutter_flow_model.dart';
// import '/flutter_flow/flutter_flow_animations.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_animate/flutter_animate.dart';

// class RestPassword extends StatefulWidget {
//   const RestPassword({Key? key}) : super(key: key);

//   @override
//   State<RestPassword> createState() => _RestPasswordState();
// }

// class _RestPasswordState extends State<RestPassword>
//     with TickerProviderStateMixin {
//   late String email = '';

//   var hasButtonTriggered = false;

//   final animationsMap = {
//     'buttonOnPageLoadAnimation': AnimationInfo(
//       trigger: AnimationTrigger.onPageLoad,
//       applyInitialState: false,
//       effects: [
//         MoveEffect(
//           curve: Curves.easeInOut,
//           delay: 0.ms,
//           duration: 600.ms,
//           begin: const Offset(0, 0),
//           end: const Offset(0, 0),
//         ),
//       ],
//     ),
//     'buttonOnActionTriggerAnimation': AnimationInfo(
//       trigger: AnimationTrigger.onActionTrigger,
//       applyInitialState: false,
//       effects: [
//         ScaleEffect(
//           curve: Curves.elasticOut,
//           delay: 30.ms,
//           duration: 500.ms,
//           begin: const Offset(0.7, 1),
//           end: const Offset(1, 1),
//         ),
//       ],
//     ),
//   };

//   @override
//   void initState() {
//     super.initState();

//     setupAnimations(
//       animationsMap.values.where((anim) =>
//           anim.trigger == AnimationTrigger.onActionTrigger ||
//           !anim.applyInitialState),
//       this,
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff251f34),
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         elevation: 0,
//         //leading: backButton(context),
//         backgroundColor: const Color(0xff251f34),
//       ),
//       body: Container(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
//                 child: Text(
//                   'Reset Password',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 25),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: TextField(
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   cursorColor: Colors.white,
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       fillColor: const Color(0xFFF1F4F8),
//                       filled: true,
//                       focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color.fromARGB(255, 77, 78, 78), width: 2.0),
//                         borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       )),
//                   onChanged: (value) {
//                     setState(() {
//                       email = value;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
//                 child: FFButtonWidget(
//                   onPressed: () async {
//                     if (animationsMap['buttonOnActionTriggerAnimation'] !=
//                         null) {
//                       setState(() => hasButtonTriggered = true);

//                       SchedulerBinding.instance.addPostFrameCallback(
//                           (_) async => await animationsMap[
//                                   'buttonOnActionTriggerAnimation']!
//                               .controller
//                               .forward(from: 0.0));

//                       await FirebaseAuth.instance
//                           .sendPasswordResetEmail(email: email)
//                           .then((value) => Navigator.of(context).pop());
//                     }
//                   },
//                   text: 'Send Request',
//                   options: FFButtonOptions(
//                     width: double.infinity,
//                     height: 44,
//                     padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                     iconPadding:
//                         const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                     color: const Color(0xFF4B39EF),
//                     textStyle: const TextStyle(
//                       fontFamily: 'Plus Jakarta Sans',
//                       color: Colors.white,
//                       fontSize: 16,
//                       letterSpacing: 0,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     elevation: 3,
//                     borderSide: const BorderSide(
//                       color: Colors.transparent,
//                       width: 1,
//                     ),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   showLoadingIndicator: false,
//                 ).animateOnActionTrigger(
//                     animationsMap['buttonOnActionTriggerAnimation']!,
//                     hasBeenTriggered: hasButtonTriggered),
//               ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!),

//             ]),
//       ),
//     );
//   }
// }

import 'package:eyeqmother/Screens/forger.dart';
import 'package:eyeqmother/Screens/login_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:eyeqmother/Screens/Home.dart';
import 'package:eyeqmother/Screens/Signup.dart';
import 'package:eyeqmother/components/page_transmission.dart';
import 'package:eyeqmother/resources/app_images.dart';

import '../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:firebase_auth/firebase_auth.dart';

class forget extends StatefulWidget {
  const forget({super.key});

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> with TickerProviderStateMixin {
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  bool passwordVisibility = false;
  bool checkboxValue = true;
  late String email = '';
  late bool _showSpinner = false;
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

    emailAddressController = TextEditingController();
    passwordController = TextEditingController();

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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  width: 100,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: const AlignmentDirectional(0, -1),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                AppImages().signuP_login_logo,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.08,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(
                            maxWidth: 430,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Resert Password',
                                    style: TextStyle(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFF101213),
                                      fontSize: 25,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 5),
                                    child: Text(
                                      'Email Address',
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: emailAddressController,
                                        //  focusNode: _model.emailAddressFocusNode,
                                        autofocus: false,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: const TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFF4B39EF),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          filled: true,
                                          fillColor: const Color(0xFFF1F4F8),
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF101213),
                                          fontSize: 16,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        minLines: null,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        // validator: _model
                                        //     .emailAddressControllerValidator
                                        //     .asValidator(context),
                                        onChanged: (value) {
                                          setState(() {
                                            emailAddressController.text = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 35, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (animationsMap[
                                                'buttonOnActionTriggerAnimation'] !=
                                            null) {
                                          setState(
                                              () => hasButtonTriggered = true);

                                          SchedulerBinding.instance
                                              .addPostFrameCallback((_) async {
                                            await animationsMap[
                                                    'buttonOnActionTriggerAnimation']!
                                                .controller
                                                .forward(from: 0.0);
                                          });

                                          String email = emailAddressController
                                              .text
                                              .trim();
                                          if (email.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Please fill in fields.'),
                                              ),
                                            );
                                          } else {
                                            try {
                                              await FirebaseAuth.instance
                                                  .sendPasswordResetEmail(
                                                      email: email);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginWidget()),
                                              );
                                            } catch (e) {
                                              print(
                                                  "Error sending password reset email: $e");
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'User does not exist.'),
                                                ),
                                              );
                                            }
                                          }
                                        }
                                      },
                                      text: 'Update your password',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 44,
                                        padding: const EdgeInsets.all(
                                            0), // Removed EdgeInsetsDirectional
                                        iconPadding: const EdgeInsets.all(
                                            0), // Removed EdgeInsetsDirectional
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
                                    )
                                        .animateOnActionTrigger(
                                          animationsMap[
                                              'buttonOnActionTriggerAnimation']!,
                                          hasBeenTriggered: hasButtonTriggered,
                                        )
                                        .animateOnPageLoad(animationsMap[
                                            'buttonOnPageLoadAnimation']!),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
