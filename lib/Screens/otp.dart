import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:eyeqmother/Screens/Home.dart';
import 'package:eyeqmother/flutter_flow/flutter_flow_animations.dart';

import '../components/page_transmission.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '../resources/app_images.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

import 'otpmodel.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget({super.key});

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

  @override
  void initState() {
    _model = createModel(context, () => OtpModel());
    super.initState();

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
                  height: MediaQuery.sizeOf(context).height * 0.45,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: Text(
                          'Enter 4 digit verification code sent to your registered mobile number.',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: _model.pinCodeControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: Text(
                                    '01:00',
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Resend OTP',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
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

                            TransitionUtils.navigateWithAnimation1(
                                context, const HomeWidget());
                          },
                          text: 'Submit',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            height: 44,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                            animationsMap['buttonOnActionTriggerAnimation']!,
                            hasBeenTriggered: hasButtonTriggered),
                      ).animateOnPageLoad(
                          animationsMap['buttonOnPageLoadAnimation']!),
                    ],
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
