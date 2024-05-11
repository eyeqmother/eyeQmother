import 'package:flutter/material.dart';

class StepWidget extends StatelessWidget {
  final String stepNumber;
  final String text;

  const StepWidget({
    Key? key,
    required this.stepNumber,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Step $stepNumber: ',
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.black,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: text,
                style: const TextStyle(),
              ),
            ],
            style: const TextStyle(
              fontFamily: 'Readex Pro',
              fontSize: 14,
              letterSpacing: 0,
            ),
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
