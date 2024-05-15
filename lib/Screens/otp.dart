import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:eyeqmother/Screens/Home.dart';
import 'package:eyeqmother/flutter_flow/flutter_flow_animations.dart';

import '../components/page_transmission.dart';
import '../cryptoService.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '../resources/app_images.dart';
import '../userData.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

import 'newPassword.dart';
import 'otpmodel.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.verificationId,
      this.type = "register"});
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String verificationId;
  final String type;

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> with TickerProviderStateMixin {
  late OtpModel _model;

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

  int _timerSeconds = 60;
  bool _timerCompleted = false;
  late Timer _timer;
  bool loading = false;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timerSeconds == 0) {
          setState(() {
            _timerCompleted = true;
            timer.cancel();
          });
        } else {
          setState(() {
            _timerSeconds--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    _model = createModel(context, () => OtpModel());
    super.initState();
    print("Token: ${widget.verificationId}");
    startTimer();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, -1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      AppImages().otp,
                      width: MediaQuery.sizeOf(context).width * 0.85,
                      height: MediaQuery.sizeOf(context).height * 0.35,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.9),
                        offset: const Offset(
                          0,
                          2,
                        ),
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
                            child: Text(
                              'OTP',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                          child: Text(
                            'Enter 6 digit verification code sent to your registered mobile number.',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 20, 20, 0),
                          child: PinCodeTextField(
                            autoDisposeControllers: false,
                            appContext: context,
                            length: 6,
                            textStyle: const TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            enableActiveFill: false,
                            autoFocus: false,
                            enablePinAutofill: false,
                            errorTextSpace: 16,
                            showCursor: true,
                            cursorColor: Colors.black,
                            obscureText: false,
                            hintCharacter: '●',
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              fieldHeight: 50,
                              fieldWidth: 50,
                              borderWidth: 2,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              shape: PinCodeFieldShape.box,
                              activeColor: Colors.black,
                              inactiveColor: Colors.grey,
                              selectedColor: Colors.black,
                              activeFillColor: Colors.black,
                              inactiveFillColor: Colors.grey,
                              selectedFillColor: Colors.black,
                            ),
                            controller: _model.pinCodeController,
                            onChanged: (_) {},
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: _model.pinCodeControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Icon(
                                    Icons.timer_sharp,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                    child: Text(
                                      '00:$_timerSeconds',
                                      style: const TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 12,
                                        letterSpacing: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: GestureDetector(
                                onTap: () async {
                                  if (_timerCompleted) {
                                    _timerSeconds = 60;
                                    _timerCompleted = false;
                                    startTimer();
                                    await resendOTP(
                                        widget.phoneNumber, context);
                                  }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Opacity(
                                      opacity: _timerCompleted ? 1 : 0.5,
                                      child: Text(
                                        'Resend OTP',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: loading,
                          child: Center(
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              padding: EdgeInsets.all(10),
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  15, 35, 30, 15),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: const Color(0xFF4B39EF),
                              ),
                              child: Center(
                                  child: const CircularProgressIndicator(
                                color: Colors.white,
                              )),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !loading,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 35, 0, 20),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation'] !=
                                    null) {
                                  setState(() => hasButtonTriggered = true);

                                  SchedulerBinding.instance.addPostFrameCallback(
                                      (_) async => await animationsMap[
                                              'buttonOnActionTriggerAnimation']!
                                          .controller
                                          .forward(from: 0.0));
                                }

                                FirebaseAuth _auth = FirebaseAuth.instance;

                                try {
                                  loading = true;
                                  setState(() {});
                                  PhoneAuthCredential phoneCredential =
                                      PhoneAuthProvider.credential(
                                          verificationId: widget.verificationId,
                                          smsCode:
                                              _model.pinCodeController!.text);
                                  await _auth
                                      .signInWithCredential(phoneCredential);

                                  if (widget.type == "register") {
                                    final credential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                      email: widget.email,
                                      password: widget.password,
                                    );

                                    if (credential.user != null) {
                                      print('Signup successful');
                                      userEmail = widget.email;
                                      userName = widget.name;
                                      await storeUserData(widget.email,
                                          widget.password, widget.phoneNumber, widget.name);
                                      // Navigate to OTP widget or other destination
                                      loading = false;
                                      setState(() {});
                                      TransitionUtils.navigateWithAnimation(
                                          context, const HomeWidget());
                                    }
                                  } else if (widget.type == "forgot-password") {
                                    TransitionUtils.navigateWithAnimation(
                                        context, NewPasswordScreen(
                                      phoneNumber: widget.phoneNumber,
                                    ));
                                  }
                                  loading = false;
                                  setState(() {});
                                } on FirebaseAuthException catch (e) {
                                  String errorMessage;
                                  loading = false;
                                  setState(() {});

                                  switch (e.code) {
                                    case 'weak-password':
                                      errorMessage =
                                          'The password provided is too weak.';
                                      break;
                                    case 'email-already-in-use':
                                      errorMessage =
                                          'The account already exists for that email.';
                                      break;
                                    case 'invalid-email':
                                      errorMessage =
                                          'The email address is malformed.';
                                      break;
                                    default:
                                      errorMessage =
                                          'An error occurred: ${e.message}';
                                  }

                                  print(errorMessage);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(errorMessage),
                                    ),
                                  );
                                } catch (e) {
                                  loading = false;
                                  setState(() {});
                                  print('An unexpected error occurred: $e');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('An unexpected error occurred.'),
                                    ),
                                  );
                                }
                              },
                              text: 'Submit',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.7,
                                height: 44,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
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
                                animationsMap[
                                    'buttonOnActionTriggerAnimation']!,
                                hasBeenTriggered: hasButtonTriggered),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation']!),
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

  Future<void> storeUserData(
      String email, String password, String phoneNumber, String name) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Create a reference to the user collection
      CollectionReference users = firestore.collection('users');

      // Add a new document with a generated id
      await users.add({
        'email': email,
        'password': password,
        'name': name,
        'phone_number': phoneNumber,
      });

      print('User data stored successfully!');
    } catch (e) {
      print('Error storing user data: $e');
    }
  }

  Future<void> resendOTP(String phoneNumber, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // This callback will be invoked in some devices where auto-verification is possible.
          // You can use the `credential` to sign in the user if needed.
          // For example:
          // AuthResult result = await _auth.signInWithCredential(credential);
          // FirebaseUser user = result.user;
        },
        verificationFailed: (FirebaseAuthException authException) {
          String errorMessage;
          switch (authException.code) {
            case 'invalid-phone-number':
              errorMessage = 'Invalid phone number';
              break;
            case 'quota-exceeded':
              errorMessage = 'SMS quota exceeded for the project';
              break;
            case 'cancelled':
              errorMessage = 'Verification canceled';
              break;
            // Add more cases as needed
            default:
              errorMessage =
                  'Verification failed. Code: ${authException.code}. Message: ${authException.message}';
              break;
          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(errorMessage),
            duration: const Duration(seconds: 3),
          ));
        },
        codeSent: (String verificationId, int? resendToken) async {
          // A code has been resent to the provided phone number
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Code resent to $phoneNumber'),
            duration: const Duration(seconds: 3),
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // This callback will be invoked when the auto-retrieval of the OTP times out.
          // You can use the `verificationId` to manually verify the OTP later.
        },
        forceResendingToken: null, // Pass null to trigger resending the OTP
      );
    } catch (e) {
      print('Error resending OTP: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error resending OTP: $e'),
        duration: const Duration(seconds: 3),
      ));
    }
  }
}
