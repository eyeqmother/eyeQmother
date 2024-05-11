import 'package:flutter/material.dart';

Widget buildMessageWidget(BuildContext context, Color backgroundColor,
    String text, String icorrect, String Correct, String cNtext) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Readex Pro',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your answer ${icorrect} was ${cNtext} ',
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                ),
              ),
              Text(
                'Correct answer ${Correct}',
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildMessageWidget1(
    BuildContext context, Color backgroundColor, String text, String text1) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              "W",
              style: TextStyle(
                fontFamily: 'Readex Pro',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your answer ${text1} was incorrect',
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                ),
              ),
              Text(
                'Correct answer ${text}',
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildMessageWidget2(BuildContext context, Color backgroundColor,
    String text, String icorrect, String Correct, String cNtext) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Readex Pro',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your answer was ${icorrect} ',
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                ),
              ),
              // Text(
              //   'Correct answer ${Correct}',
              //   style: const TextStyle(
              //     fontFamily: 'Readex Pro',
              //   ),
              // ),
            ],
          ),
        ),
      ],
    ),
  );
}
