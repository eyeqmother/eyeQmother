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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeqmother/Screens/forger.dart';
import 'package:eyeqmother/userData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:eyeqmother/Screens/Home.dart';
import 'package:eyeqmother/Screens/Signup.dart';
import 'package:eyeqmother/components/page_transmission.dart';
import 'package:eyeqmother/resources/app_images.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'otp.dart';

class forget extends StatefulWidget {
  const forget({super.key});

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> with TickerProviderStateMixin {
   TextEditingController phoneNumberController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = false;
  bool checkboxValue = true;
  late String email = '';
  late bool _showSpinner = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasButtonTriggered = false;
   PhoneNumber phoneNumber = PhoneNumber();
   String finalPhoneNumber = "";
   bool loading = false;


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

    phoneNumberController = TextEditingController();
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
                                    'Reset Password',
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
                                      'Phone Number',
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Colors.black,
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  InternationalPhoneNumberInput(
                                    onInputChanged: (PhoneNumber number) {
                                      phoneNumberController.text = phoneNumberController.text.removeFirstZero();
                                      finalPhoneNumber = number.phoneNumber!;

                                    },
                                    onInputValidated: (bool value) {
                                      print(value);
                                    },
                                    selectorConfig: SelectorConfig(
                                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                      useBottomSheetSafeArea: true,
                                    ),

                                    inputDecoration: InputDecoration(
                                      labelText: 'Phone Number',
                                      labelStyle: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF57636C),
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF4B39EF),
                                          width: 1,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 1,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder:
                                      OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 1,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF1F4F8),
                                    ),
                                    ignoreBlank: false,
                                    autoValidateMode: AutovalidateMode.disabled,
                                    selectorTextStyle: TextStyle(color: Colors.black),
                                    initialValue: phoneNumber,
                                    textFieldController: phoneNumberController,
                                    formatInput: true,
                                    keyboardType:
                                    TextInputType.numberWithOptions(signed: true, decimal: true),
                                    inputBorder: OutlineInputBorder(),
                                    onSaved: (PhoneNumber number) {
                                      print('On Saved: $number');
                                    },
                                  ),
                                  Visibility(
                                    visible: loading,
                                    child: Center(
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        padding: EdgeInsets.all(10),
                                        margin:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 35, 0, 0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: const Color(0xFF4B39EF),
                                        ),
                                        child: Center(child: const CircularProgressIndicator(color: Colors.white,)),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !loading,
                                    child: Padding(
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

                                            if (finalPhoneNumber.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Please fill in fields.'),
                                                ),
                                              );

                                              loading = false;
                                              setState(() {});
                                            } else {
                                              bool value = await isUserDataExists(finalPhoneNumber);

                                              if(value){
                                                try {
                                                  FirebaseAuth _auth =
                                                      FirebaseAuth.instance;

                                                  await _auth.verifyPhoneNumber(
                                                    phoneNumber:
                                                        finalPhoneNumber,
                                                    timeout:
                                                        Duration(seconds: 60),
                                                    verificationCompleted:
                                                        (AuthCredential
                                                            credential) async {
                                                      // This callback will be invoked in some devices where auto-verification is possible.
                                                      // You can use the `credential` to sign in the user if needed.
                                                      // For example:
                                                      // AuthResult result = await _auth.signInWithCredential(credential);
                                                      // FirebaseUser user = result.user;
                                                      loading = false;
                                                      setState(() {});
                                                    },
                                                    verificationFailed:
                                                        (FirebaseAuthException
                                                            authException) {
                                                      loading = false;
                                                      setState(() {});
                                                      String errorMessage;
                                                      switch (
                                                          authException.code) {
                                                        case 'invalid-phone-number':
                                                          errorMessage =
                                                              'Invalid phone number';
                                                          break;
                                                        case 'quota-exceeded':
                                                          errorMessage =
                                                              'SMS quota exceeded for the project';
                                                          break;
                                                        case 'cancelled':
                                                          errorMessage =
                                                              'Verification canceled';
                                                          break;
                                                        // Add more cases as needed
                                                        default:
                                                          errorMessage =
                                                              'Verification failed. Code: ${authException.code}. Message: ${authException.message}';
                                                          break;
                                                      }
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        content:
                                                            Text(errorMessage),
                                                        duration: Duration(
                                                            seconds: 3),
                                                      ));
                                                    },
                                                    codeSent: (String
                                                            verificationId,
                                                        int?
                                                            resendToken) async {
                                                      loading = false;
                                                      setState(() {});
                                                      TransitionUtils
                                                          .navigateWithAnimation1(
                                                              context,
                                                              OtpWidget(
                                                                email: "",
                                                                phoneNumber:
                                                                    finalPhoneNumber,
                                                                password:
                                                                    passwordController
                                                                        .text,
                                                                verificationId:
                                                                    verificationId,
                                                                type:
                                                                    "forgot-password",
                                                              ));
                                                      print(
                                                          'Code sent to $phoneNumber');
                                                    },
                                                    codeAutoRetrievalTimeout:
                                                        (String
                                                            verificationId) {
                                                      loading = false;
                                                      setState(() {});
                                                      // This callback will be invoked when the auto-retrieval of the OTP times out.
                                                      // You can use the `verificationId` to manually verify the OTP later.
                                                    },
                                                  );
                                                } catch (e) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Error sending in otp"),
                                                    duration:
                                                        Duration(seconds: 3),
                                                  ));
                                                }
                                              }else{
                                                loading = false;
                                                setState(() {});
                                                ScaffoldMessenger.of(
                                                    context)
                                                    .showSnackBar(SnackBar(
                                                  content:
                                                  Text("The Phoner number is not registered. Kindly create your account"),
                                                  duration:
                                                  Duration(seconds: 3),
                                                ));
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

   Future<bool> isUserDataExists(String phoneNumber) async {
     try {
       FirebaseFirestore firestore = FirebaseFirestore.instance;

       // Create a reference to the user collection
       CollectionReference users = firestore.collection('users');


       // Query Firestore to check if phone number exists
       QuerySnapshot phoneNumberQuery =
       await users.where('phone_number', isEqualTo: phoneNumber).get();

       // If email or phone number exists, return true
       if ( phoneNumberQuery.docs.isNotEmpty) {
         return true;
       } else {
         return false;
       }
     } catch (e) {
       print('Error checking user data: $e');
       return false; // Return false in case of an error
     }
   }

}
