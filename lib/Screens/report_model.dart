import 'package:flutter/material.dart';

Widget buildMessageWidget(BuildContext context, Color backgroundColor,
    String text, String icorrect, String Correct) {
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
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
          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Correct == icorrect) ...{
                Text(
                  'Your answer ${Correct} was correct ',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                  ),
                ),
              } else ...{
                Text(
                  'Your answer ${icorrect} was incorrect ',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                  ),
                ),
                Text(
                  'Correct answer ${Correct}',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                  ),
                ),
              },
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
    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.09,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
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
          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your answer ${text1} was incorrect',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                ),
              ),
              Text(
                'Correct answer ${text}',
                style: TextStyle(
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
