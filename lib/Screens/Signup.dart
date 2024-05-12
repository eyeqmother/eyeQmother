import 'package:eyeqmother/Screens/Home.dart';
import 'package:eyeqmother/Screens/login_widget.dart';
import 'package:eyeqmother/Screens/otp.dart';
import 'package:eyeqmother/resources/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:validators/validators.dart' as validator;
import '../components/page_transmission.dart';
import '/flutter_flow/flutter_flow_animations.dart';

import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget>
    with TickerProviderStateMixin {
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  bool passwordVisibility = false;
  bool checkboxValue = true;
  late final String codeDigits;
  String tokenPhone = "";
  late String dialCodeDigits;
  late bool _showSpinner = true;
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
    _showSpinner = false;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: AlignmentDirectional(0, -1),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          alignment: AlignmentDirectional(-1, 0),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                AppImages().signuP_login_logo,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 430,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsets.all(24),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFF101213),
                                      fontSize: 25,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: emailAddressController,
                                        //  focusNode: emailAddressFocusNode,
                                        autofocus: false,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Email',
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
                                        style: TextStyle(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF101213),
                                          fontSize: 16,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        minLines: null,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        // validator:
                                        //     emailAddressControllerValidator
                                        //     .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 5),
                                    child: Text(
                                      'Password',
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: passwordController,
                                        //    focusNode: passwordFocusNode,
                                        autofocus: false,
                                        autofillHints: [AutofillHints.password],
                                        obscureText: !passwordVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
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
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => passwordVisibility =
                                                  !passwordVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              passwordVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: Color(0xFF57636C),
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF101213),
                                          fontSize: 16,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        minLines: null,
                                        // validator: _model
                                        //     .passwordControllerValidator
                                        //     .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 5),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, screenHeight * 0.01, 0, 0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: IntlPhoneField(
                                        decoration: InputDecoration(
                                          labelText: '   Phone Number',
                                          labelStyle: const TextStyle(
                                            fontFamily: 'Readex Pro',
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFF57636C),
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
                                          focusedErrorBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF4B39EF),
                                              width: 2,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor:
                                              Colors.grey.withOpacity(0.1),
                                        ),
                                        initialCountryCode: 'PK',
                                        onChanged: (phone) {
                                          sendPhoneNumberToServer(
                                              phone.completeNumber,
                                              phone.countryCode);
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    Colors.black,
                                              ),
                                              child: Checkbox(
                                                value: checkboxValue ??= true,
                                                onChanged: (newValue) async {
                                                  setState(() => checkboxValue =
                                                      newValue!);
                                                },
                                                side: BorderSide(
                                                  width: 2,
                                                  color: Colors.black,
                                                ),
                                                activeColor: Colors.black,
                                                checkColor:
                                                    const Color(0xFF4B39EF),
                                              ),
                                            ),
                                            Text(
                                              'By signing up, you are agree to our Terms ',
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '& Conditions and Policies',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
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
                                        }
                                        if (emailAddressController.text
                                                .trim()
                                                .isEmpty ||
                                            passwordController.text
                                                .trim()
                                                .isEmpty ||
                                            tokenPhone.toString().isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Please fill in all fields.'),
                                            ),
                                          );
                                        } else {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OtpWidget(
                                                        phone: tokenPhone,
                                                        codeDigits:
                                                            dialCodeDigits,
                                                        email:
                                                            emailAddressController
                                                                .text
                                                                .trim(),
                                                        password:
                                                            passwordController
                                                                .text
                                                                .trim(),
                                                      )));
                                          // try {

                                          //   final credential = await FirebaseAuth
                                          //       .instance
                                          //       .createUserWithEmailAndPassword(
                                          //     email: emailAddressController.text
                                          //         .trim(),
                                          //     password: passwordController.text
                                          //         .trim(),
                                          //   );

                                          //   if (credential.user != null) {
                                          //     print('Signup successful');
                                          //     // Navigate to OTP widget or other destination
                                          //     TransitionUtils
                                          //         .navigateWithAnimation(
                                          //             context,
                                          //             const HomeWidget());
                                          //   }
                                          // } on FirebaseAuthException catch (e) {
                                          //   String errorMessage;

                                          //   switch (e.code) {
                                          //     case 'weak-password':
                                          //       errorMessage =
                                          //           'The password provided is too weak.';
                                          //       break;
                                          //     case 'email-already-in-use':
                                          //       errorMessage =
                                          //           'The account already exists for that email.';
                                          //       break;
                                          //     case 'invalid-email':
                                          //       errorMessage =
                                          //           'The email address is malformed.';
                                          //       break;
                                          //     default:
                                          //       errorMessage =
                                          //           'An error occurred: ${e.message}';
                                          //   }

                                          //   print(errorMessage);
                                          //   ScaffoldMessenger.of(context)
                                          //       .showSnackBar(
                                          //     SnackBar(
                                          //       content: Text(errorMessage),
                                          //     ),
                                          //   );
                                          // } catch (e) {
                                          //   print(
                                          //       'An unexpected error occurred: $e');
                                          //   ScaffoldMessenger.of(context)
                                          //       .showSnackBar(
                                          //     SnackBar(
                                          //       content: Text(
                                          //           'An unexpected error occurred.'),
                                          //     ),
                                          //   );
                                          // }
                                        }
                                      },
                                      text: 'Sign Up',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 44,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
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
                                  ).animateOnPageLoad(animationsMap[
                                      'buttonOnPageLoadAnimation']!),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 12),
                                      child: GestureDetector(
                                        onTap: () {
                                          TransitionUtils
                                              .navigateWithAnimation1(
                                                  context, const LoginWidget());
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Don\'t have an account? ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: ' Sign In',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF4B39EF),
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                            style: TextStyle(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF101213),
                                              fontSize: 14,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendPhoneNumberToServer(String completeNumber, String countryCode) {
    tokenPhone = completeNumber;
    dialCodeDigits = countryCode;
  }
}
