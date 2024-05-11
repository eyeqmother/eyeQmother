import 'package:eyeqmother/Screens/forger.dart';
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

import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  bool passwordVisibility = false;
  bool checkboxValue = true;

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
                                    'Login In',
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
                                      ),
                                    ),
                                  ),

                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 5),
                                    child: Text(
                                      'Password Address',
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
                                        controller: passwordController,
                                        //  focusNode: passwordFocusNode,
                                        autofocus: false,
                                        autofillHints: [AutofillHints.password],
                                        obscureText: !passwordVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
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
                                              color: const Color(0xFF57636C),
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF101213),
                                          fontSize: 16,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        minLines: null,
                                        // validator:
                                        //     passwordControllerValidator
                                        //     .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          TransitionUtils
                                              .navigateWithAnimation1(
                                                  context, forget());
                                        },
                                        child: Text(
                                          'Forget password?',
                                          style: TextStyle(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.black,
                                            fontSize: 12,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
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
                                              .addPostFrameCallback((_) async =>
                                                  await animationsMap[
                                                          'buttonOnActionTriggerAnimation']!
                                                      .controller
                                                      .forward(from: 0.0));
                                        }
                                        print(emailAddressController.text);

                                        if (emailAddressController.text
                                                .trim()
                                                .isEmpty ||
                                            passwordController.text
                                                .trim()
                                                .isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Please fill in all fields.'),
                                            ),
                                          );
                                        } else {
                                          try {
                                            final credential =
                                                await FirebaseAuth.instance
                                                    .signInWithEmailAndPassword(
                                              email: emailAddressController.text
                                                  .trim(),
                                              password: passwordController.text
                                                  .trim(),
                                            );

                                            if (credential.user != null) {
                                              print('Login successful');
                                              // Navigate to OTP widget or other destination
                                              TransitionUtils
                                                  .navigateWithAnimation(
                                                      context,
                                                      const HomeWidget());
                                            }
                                          } on FirebaseAuthException catch (e) {
                                            String errorMessage;

                                            switch (e.code) {
                                              case 'user-not-found':
                                                errorMessage =
                                                    'No user found for that email.';
                                                break;
                                              case 'wrong-password':
                                                errorMessage =
                                                    'Wrong password provided for that user.';
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
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(errorMessage),
                                              ),
                                            );
                                          } catch (e) {
                                            print(
                                                'An unexpected error occurred: $e');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'An unexpected error occurred.'),
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      text: 'Login',
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
                                  // You will have to add an action on this rich text to go to your login page.
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 12),
                                      child: GestureDetector(
                                        onTap: () {
                                          TransitionUtils
                                              .navigateWithAnimation1(context,
                                                  const SignupWidget());
                                        },
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: const TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Don\'t have an account? ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: ' Sign up here',
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
}
